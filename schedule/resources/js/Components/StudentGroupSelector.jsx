import React, { useState, useEffect } from 'react';
import axios from 'axios';

const StudentGroupSelector = ({ onChange }) => {
    const [loading, setLoading] = useState(false);
    const [faculties, setFaculties] = useState([]);
    const [fos, setFOS] = useState([]);
    const [years, setYears] = useState([]);
    const [specialisations, setSpecialisations] = useState([]);
    const [stationaries, setStationaries] = useState([]);
    const [specGroups, setSpecGroups] = useState([]);
    const [groups, setGroups] = useState([]);

    useEffect(() => {
        setLoading(true);
        axios.get('/get_faculties')
            .then(response => {
                setFaculties(response.data);
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    }, []);

    const handleFacultyChange = event => {
        const facultyId = event.target.value;
        if (!facultyId) {
            setFOS([]);
            setYears([]);
            setSpecialisations([]);
            setStationaries([]);
            setSpecGroups([]);
            setGroups([]);
            return;
        }
        setLoading(true);
        axios.get(`/get_fos/${facultyId}`)
            .then(response => {
                setFOS(response.data);
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleFOSChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = event.target.value;
        if (!fosName) {
            setYears([]);
            setSpecialisations([]);
            setStationaries([]);
            setSpecGroups([]);
            setGroups([]);
            return;
        }
        setLoading(true);
        axios.get(`/get_year/${facultyId}/${fosName}`)
            .then(response => {
                setYears(response.data);
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleYearChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value;
        const yearNumber = event.target.value;
        if (!yearNumber) {
            setSpecialisations([]);
            setStationaries([]);
            setSpecGroups([]);
            setGroups([]);
            return;
        }
        setLoading(true);
        axios.get(`/get_specialisation/${facultyId}/${fosName}/${yearNumber}`)
            .then(response => {
                setSpecialisations(response.data);
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleSpecialisationChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value;
        const yearNumber = document.getElementById('year-select').value;
        const specialisationName = event.target.value;
        if (!specialisationName) {
            setStationaries([]);
            setSpecGroups([]);
            setGroups([]);
            return;
        }
        setLoading(true);
        axios.get(`/get_stationary/${facultyId}/${fosName}/${yearNumber}/${specialisationName}`)
            .then(response => {
                setStationaries(response.data);
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleStationaryChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value;
        const yearNumber = document.getElementById('year-select').value;
        const specialisationName = document.getElementById('specialisation-select').value;
        const stationaryName = event.target.value;
        if (!stationaryName) {
            setSpecGroups([]);
            setGroups([]);
            return;
        }
        setLoading(true);
        axios.get(`/get_spec_group/${facultyId}/${fosName}/${yearNumber}/${specialisationName}/${stationaryName}`)
            .then(response => {
                setSpecGroups(response.data);
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleSpecGroupChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value;
        const yearNumber = document.getElementById('year-select').value;
        const specialisationName = document.getElementById('specialisation-select').value;
        const stationaryName = document.getElementById('stationary-select').value;
        const specGroupName = event.target.value;
        if (!specGroupName) {
            setGroups([]);
            return;
        }
        setLoading(true);
        axios.get(`/get_group/${facultyId}/${fosName}/${yearNumber}/${specialisationName}/${specGroupName}/${stationaryName}`)
            .then(response => {
                setGroups(response.data);
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    return (
        <div>
            <label className={'text-gray-300'} htmlFor="faculty-select">Faculty:</label>
            <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="faculty-select" onChange={handleFacultyChange}>
                <option value="">Select faculty</option>
                {faculties.map(faculty => (
                    <option key={faculty.id_faculty} value={faculty.id_faculty}>
                        {faculty.faculty_name}
                    </option>
                ))}
            </select>
            {loading && <p>Loading...</p>}
            {fos.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="fos-select">Field of study:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="fos-select" onChange={handleFOSChange}>
                        <option value="">Select field of study</option>
                        {fos.map(fosItem => (
                            <option key={fosItem.id_fos} value={fosItem.fos_name}>
                                {fosItem.fos_name}
                            </option>
                        ))}
                    </select>
                    {loading && <p>Loading...</p>}
                </>
            )}
            {years.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="year-select">Year:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="year-select" onChange={handleYearChange}>
                        <option value="">Select year</option>
                        {years.map(year => (
                            <option key={year} value={year}>
                                {year}
                            </option>
                        ))}
                    </select>
                    {loading && <p>Loading...</p>}
                </>
            )}
            {specialisations.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="specialisation-select">Specialisation:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="specialisation-select" onChange={handleSpecialisationChange}>
                        <option value="">Select specialisation</option>
                        {specialisations.map(specialisation =>  (
                            <option key={specialisation.id_specialisation} value={specialisation.specialisation_name}>
                                {specialisation.specialisation_name}
                            </option>
                        ))}
                    </select>
                    {loading && <p>Loading...</p>}
                </>
            )}
            {stationaries.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="stationary-select">Stationary:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="stationary-select" onChange={handleStationaryChange}>
                        <option value="">Select stationarity</option>
                        {stationaries.map(stationary =>  (
                            <option key={stationary.id_stationary} value={stationary.stationary_name}>
                                {stationary.stationary_name}
                            </option>
                        ))}
                    </select>
                    {loading && <p>Loading...</p>}
                </>
            )}
            {specGroups.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="spec-group-select">Specialisation group:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="spec-group-select" onChange={handleSpecGroupChange}>
                        <option value="">Select specialisation group</option>
                        {specGroups.map(specGroup =>  (
                            <option key={specGroup.id_spec_group} value={specGroup.spec_group_name}>
                                {specGroup.spec_group_name}
                            </option>
                        ))}
                    </select>
                    {loading && <p>Loading...</p>}
                </>
            )}
            {groups.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="group-select">Group:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="group-select">
                        <option value="">Select group</option>
                        {groups.map(group =>  (
                            <option key={group.id_group} value={group.group_name}>
                                {group.group_name}
                            </option>
                        ))}
                    </select>
                    {loading && <p>Loading...</p>}
                </>
            )}
        </div>
    );
};

export default StudentGroupSelector;

