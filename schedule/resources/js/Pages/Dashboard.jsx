import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import PrimaryButton from "@/Components/PrimaryButton";
import Dropdown from "@/Components/Dropdown";
import TextInput from "@/Components/TextInput";
import Schedule from "@/Components/Schedule";
import StudentGroupSelector from "@/Components/StudentGroupSelector";
import {useEffect, useState} from "react";
import axios from "axios";

export default function Dashboard(props) {
    const [lectures, setLectures] = useState(null);
    const [groups, setGroups] = useState(null);

    useEffect(() => {
        axios.get(`/get_schedule/${groups}`).then((response) => {
            setLectures(response.data.schedule);
            console.log(groups)
        });
    } , [groups]);

    const handleGroupsChange = (newGroups) => {
        setGroups(newGroups);
    }

    return (
        <AuthenticatedLayout
            auth={props.auth}
            errors={props.errors}
        >
            <Head title="Calendar" />

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900 dark:text-gray-100">
                            <StudentGroupSelector onChange={handleGroupsChange} />
                            <br/>
                            <Schedule lectures={lectures} />
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
