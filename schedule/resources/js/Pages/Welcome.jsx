import { Link, Head } from '@inertiajs/react';
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Schedule from '../Components/Schedule.jsx';
import StudentGroupSelector from "@/Components/StudentGroupSelector";
import ErrorBoundary from "@/Components/ErrorBoundary";

export default function Welcome(props) {
    const [lectures, setLectures] = useState(null);

    useEffect(() => {
        axios.get('/get_schedule/105/').then((response) => {
            setLectures(response.data.schedule);
        });
    } , []);

    return (
        <>
            <Head title="Welcome" />
            <div className="relative sm:flex sm:justify-center sm:items-center min-h-screen  bg-center bg-gray-100 dark:bg-dots-lighter dark:bg-gray-900 selection:bg-blue-300 selection:text-white">
                <div className="sm:fixed sm:top-0 sm:right-0 p-6 text-right">
                    {props.auth.user ? (
                        <Link
                            href={route('dashboard')}
                            className="font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-blue-300"
                        >
                            {props.auth.user.name}
                        </Link>
                    ) : (
                        <>
                            <Link
                                href={route('login')}
                                className="font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-blue-300"
                            >
                                Log in
                            </Link>

                            <Link
                                href={route('register')}
                                className="ml-4 font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-blue-300"
                            >
                                Register
                            </Link>
                        </>
                    )}
                </div>

                <div className="max-w-7xl mx-auto p-6 lg:p-8">
                    <div className="flex flex-col sm:flex-row sm:justify-center sm:items-center">
                        <h1 className="text-4xl">
                            <span className="text-white">PLAN.</span><span className="text-blue-500">IO</span>
                        </h1>
                    </div>
                    <div className="mt-16 sm:flex-row sm:justify-center sm:items-center">
                        <ErrorBoundary>
                        <StudentGroupSelector />
                        </ErrorBoundary>
                    </div>
                    <div className="mt-16">
                        <Schedule lectures={lectures} />
                    </div>
                </div>
            </div>

            <style>{`
                .bg-dots-darker {
                    background-image: url("data:image/svg+xml,%3Csvg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1.22676 0C1.91374 0 2.45351 0.539773 2.45351 1.22676C2.45351 1.91374 1.91374 2.45351 1.22676 2.45351C0.539773 2.45351 0 1.91374 0 1.22676C0 0.539773 0.539773 0 1.22676 0Z' fill='rgba(0,0,0,0.07)'/%3E%3C/svg%3E");
                }
                @media (prefers-color-scheme: dark) {
                    .dark\\:bg-dots-lighter {
                        background-image: url("data:image/svg+xml,%3Csvg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1.22676 0C1.91374 0 2.45351 0.539773 2.45351 1.22676C2.45351 1.91374 1.91374 2.45351 1.22676 2.45351C0.539773 2.45351 0 1.91374 0 1.22676C0 0.539773 0.539773 0 1.22676 0Z' fill='rgba(255,255,255,0.07)'/%3E%3C/svg%3E");
                    }
                }
            `}</style>
        </>
    );
}
