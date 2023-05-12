import React, { useState, useEffect } from 'react';
import axios from 'axios';

const StudentGroupSelector = ({ onChange }) => {
    const [loading, setLoading] = useState(false);
    const [faculties, setFaculties] = useState([]);
    const [fos, setFOS] = useState([]);
    const [years, setYears] = useState([]);
    const [specialisations, setSpecialisations] = useState([]);
    const [stationaries, setStationaries] = useState([]);
    const [isStationarySelected, setIsStationarySelected] = useState(false);
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
                console.log(error.response);
            });
    };

    const handleFOSChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value.replace(/ /g, '%20');
        console.log('facultyId:', facultyId);
        console.log('fosName:', fosName);

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
                setYears(response.data.map(year => ({ value: year.year, label: year.year })));
                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleYearChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value.replace(/ /g, '%20');
        const yearNumber = event.target.value;
        if (!yearNumber) {
            setSpecialisations([]);
            setSpecGroups([]);
            setGroups([]);
            return;
        }
        setLoading(true);
        axios.get(`/get_specialisation/${facultyId}/${fosName}/${yearNumber}`)
            .then(response => {
                setSpecialisations(response.data);
                setLoading(false);
                if (yearNumber === "0") {
                    setSpecGroups([]);
                    setGroups([]);
                }
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleSpecialisationChange = event => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value.replace(/ /g, '%20');
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

    const handleStationaryToggle = () => {
        setIsStationarySelected(!isStationarySelected);
        const newStationaryValue = isStationarySelected ? 0 : 1;
        handleStationaryChange(newStationaryValue);
    };

    const handleStationaryChange = (stationaryValue) => {
        const facultyId = document.getElementById('faculty-select').value;
        const fosName = document.getElementById('fos-select').value.replace(/ /g, '%20');
        const yearNumber = document.getElementById('year-select').value;
        const specialisationName = document.getElementById('specialisation-select').value;
        console.log('stationaryValue:', stationaryValue);

        setLoading(true);
        axios
            .get(`/get_spec_group/${facultyId}/${fosName}/${yearNumber}/${specialisationName}/${stationaryValue}`)
            .then(response => {
                const specGroupsData = response.data.map(item => ({ value: item.spec_group, label: item.spec_group }));
                setSpecGroups(specGroupsData);

                setLoading(false);
            })
            .catch(error => {
                console.log(error);
                setLoading(false);
            });
    };

    const handleSpecGroupChange = event => {

        const facultyId = document.getElementById('faculty-select').value;
        console.log('facultyId:', facultyId);
        const fosName = document.getElementById('fos-select').value.replace(/ /g, '%20');
        console.log('fosName:', fosName);
        const yearNumber = document.getElementById('year-select').value;
        console.log('yearNumber:', yearNumber);
        const specialisationName = document.getElementById('specialisation-select').value;
        console.log('specialisationName:', specialisationName);
        console.log('isStationarySelected:', isStationarySelected);
        const stationaryName = isStationarySelected ? 1 : 0;
        console.log('stationaryName:', stationaryName);
        const specGroupName = event.target.value;

        if (!specGroupName) {
            setGroups([]);
            return;
        }
        console.log(`/get_group/${facultyId}/${fosName}/${yearNumber}/${specialisationName}/${specGroupName}/${stationaryName}`);

        setLoading(true);
        axios
            .get(`/get_group/${facultyId}/${fosName}/${yearNumber}/${specialisationName}/${stationaryName}/${specGroupName}`)
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
            {fos.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="fos-select">Field of study:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="fos-select" onChange={handleFOSChange}>
                        <option value="">Select field of study</option>
                        {fos.map(fosItem => (
                            <option key={fosItem.fos} value={fosItem.fos_name}>
                                {fosItem.fos}
                            </option>
                        ))}
                    </select>
                    {loading}
                </>
            )}
            {years && years.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="year-select">Year:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="year-select" onChange={handleYearChange}>
                        <option value="">Select year</option>
                        {years.map((year, index) => (
                            <option key={index} value={year.value}>
                                {year.label}
                            </option>
                        ))}
                    </select>
                    {loading}
                </>
            )}
            {specialisations.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="specialisation-select">Specialisation:</label>
                    <select className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '} id="specialisation-select" onChange={handleSpecialisationChange}>
                        <option value="">Select specialisation</option>
                        {specialisations.map(specialisation => (
                            <option key={specialisation.specialisation} value={specialisation.specialisation}>
                                {specialisation.specialisation}
                            </option>
                        ))}
                    </select>
                    {loading}
                </>
            )}
            {stationaries.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="stationary-select">Stationary: </label>
                    <button
                        className={'dark:bg-gray-900 dark:text-gray-300 rounded-md shadow-sm '}
                        onClick={handleStationaryToggle}
                    >
                        {isStationarySelected ? 'Yes' : 'No'}
                    </button>
                    {loading}
                </>
            )}
            {specGroups.length > 0 && (
                <>
                    <label className={'text-gray-300'} htmlFor="spec-group-select">Specialisation group:</label>
                    <select
                        className={'dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm '}
                        id="spec-group-select"
                        onChange={handleSpecGroupChange}
                    >
                        <option value="">Select specialisation group</option>
                        {specGroups.map(specGroup => (
                            <option key={specGroup.value} value={specGroup.value}>
                                {specGroup.label}
                            </option>
                        ))}
                    </select>
                    {loading}
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
                    {loading}
                </>
            )}
        </div>
    );
};

export default StudentGroupSelector;

