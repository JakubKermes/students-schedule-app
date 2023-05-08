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
            <label htmlFor="faculty-select">Wydział:</label>
            <select id="faculty-select" onChange={handleFacultyChange}>
                <option value="">Wybierz wydział</option>
                {faculties.map(faculty => (
                    <option key={faculty.id_faculty} value={faculty.id_faculty}>
                        {faculty.faculty_name}
                    </option>
                ))}
            </select>
            {loading && <p>Loading...</p>}
            {fos.length > 0 && (
                <>
                    <label htmlFor="fos-select">Kierunek:</label>
                    <select id="fos-select" onChange={handleFOSChange}>
                        <option value="">Wybierz kierunek</option>
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
                    <label htmlFor="year-select">Rok:</label>
                    <select id="year-select" onChange={handleYearChange}>
                        <option value="">Wybierz rok</option>
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
                    <label htmlFor="specialisation-select">Specjalizacja:</label>
                    <select id="specialisation-select" onChange={handleSpecialisationChange}>
                        <option value="">Wybierz specjalizację</option>
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
                    <label htmlFor="stationary-select">Stacjonarność:</label>
                    <select id="stationary-select" onChange={handleStationaryChange}>
                        <option value="">Wybierz stacjonarność</option>
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
                    <label htmlFor="spec-group-select">Grupa specjalizacyjna:</label>
                    <select id="spec-group-select" onChange={handleSpecGroupChange}>
                        <option value="">Wybierz grupę specjalizacyjną</option>
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
                    <label htmlFor="group-select">Grupa:</label>
                    <select id="group-select">
                        <option value="">Wybierz grupę</option>
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

