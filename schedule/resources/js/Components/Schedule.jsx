import React from 'react';
import moment from 'moment';
import { Calendar, momentLocalizer } from 'react-big-calendar';
import 'react-big-calendar/lib/css/react-big-calendar.css';

const localizer = momentLocalizer(moment);

const Schedule = ({ lectures }) => {
    const events = lectures.map((lecture) => ({
        id: lecture.id_lecture,
        title: `Lecture #${lecture.id_lecture}`,
        start: new Date(lecture.time_start),
        end: new Date(lecture.time_end),
    }));

    return (
        <div>
            <Calendar
                localizer={localizer}
                events={events}
                startAccessor="start"
                endAccessor="end"
                style={{ height: 500 }}
            />
        </div>
    );
};

export default Schedule;
