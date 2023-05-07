import React from 'react';
import moment from 'moment';
import { Calendar, momentLocalizer } from 'react-big-calendar';
import 'react-big-calendar/lib/css/react-big-calendar.css';

const localizer = momentLocalizer(moment);

const Schedule = ({ lectures }) => {
    const events = Array.isArray(lectures)
        ? lectures.map((lecture) => ({
            id: lecture.id_lecture,
            title: `Lecture #${lecture.id_lecture}`,
            start: new Date(lecture.time_start),
            end: new Date(lecture.time_end),
        }))
        : [];

    return (
        <div className="bg-white rounded-md shadow-md p-4">
            <Calendar
                localizer={localizer}
                events={events}
                startAccessor="start"
                endAccessor="end"
                className="h-96"
                eventPropGetter={(event) => ({
                    className: 'bg-blue-500 text-white rounded-md px-2 py-1 mb-1',
                })}
                style={{ height: 500, width: '100%', margin: '0 auto' }}
            />
        </div>
    );
};

export default Schedule;
