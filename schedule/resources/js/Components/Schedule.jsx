import React, { useState } from 'react';
import moment from 'moment';
import { Calendar, momentLocalizer } from 'react-big-calendar';
import 'react-big-calendar/lib/css/react-big-calendar.css';
import TextInput from "@/Components/TextInput";

const localizer = momentLocalizer(moment);

const Schedule = ({ lectures, onAddEvent }) => {
    const [selectedDate, setSelectedDate] = useState(null);
    const [isAddingEvent, setIsAddingEvent] = useState(false);
    const [newEvent, setNewEvent] = useState({ title: '', start: null, end: null });

    const handleSelectDate = (date) => {
        setSelectedDate(date);
        setIsAddingEvent(true);
        setNewEvent({ title: '', start: date, end: date });
    };

    const handleTitleChange = (event) => {
        setNewEvent({ ...newEvent, title: event.target.value });
    };

    const handleStartChange = (date) => {
        setNewEvent({ ...newEvent, start: date });
    };

    const handleEndChange = (date) => {
        setNewEvent({ ...newEvent, end: date });
    };

    const handleSubmit = (event) => {
        event.preventDefault();

        const token = document.head.querySelector('meta[name="csrf-token"]').content;

        if (!newEvent.title || !newEvent.start || !newEvent.end) {
            return;
        }

        fetch('/schedule', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token,
            },
            body: JSON.stringify(newEvent),
        })
            .then((response) => response.json())
            .then((data) => {
                onAddEvent(data);
                setIsAddingEvent(false);
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    };


    const handleClose = () => {
        setIsAddingEvent(false);
    };

    const events = Array.isArray(lectures)
        ? lectures.reduce((acc, lecture) => {
            if (lecture.hasOwnProperty('id_lecture')) {
                acc.push({
                    id: lecture.id_lecture,
                    title: `${lecture.id_lecture}`,
                    start: new Date(lecture.time_start),
                    end: new Date(lecture.time_end),
                });
            }
            return acc;
        }, [])
        : [];

    const eventPropGetter = (event) => {
        return {
            className: 'bg-blue-500 text-white rounded-md px-2 py-1 mb-1',
        };
    };

    const dayPropGetter = (date) => {
        return {
            className: 'hover:bg-blue-100',
        };
    };

    return (
        <div className="bg-white rounded-md shadow-md p-4 text-black">
            <Calendar
                localizer={localizer}
                events={events}
                startAccessor="start"
                endAccessor="end"
                className="h-96"
                eventPropGetter={eventPropGetter}
                dayPropGetter={dayPropGetter}
                style={{ height: 500, width: '100%', margin: '0 auto' }}
                selectable
                onSelectSlot={(slotInfo) => handleSelectDate(slotInfo.start)}
            />

            {isAddingEvent && (
                <form onSubmit={handleSubmit}>
                    <div className="mt-4">
                        Title:<TextInput label="Title" value={newEvent.title} onChange={handleTitleChange} />
                    </div>
                    <div className="mt-4">
                        <label htmlFor="start">Start:</label>
                        <input type="datetime-local" id="start" value={moment(newEvent.start).format('YYYY-MM-DDTHH:mm')} onChange={(event) => handleStartChange(moment(event.target.value).toDate())} />
                    </div>
                    <div className="mt-4">
                        <label htmlFor="end">End:</label>
                        <input type="datetime-local" id="end" value={moment(newEvent.end).format('YYYY-MM-DDTHH:mm')} onChange={(event) => handleEndChange(moment(event.target.value).toDate())} />
                    </div>
                    <div className=".mt-4 flex justify-end">
                        <button type="button" className="mr-2" onClick={handleClose}>
                            Cancel
                        </button>
                        <button type="submit" className="bg-blue-500 text-white rounded-md px-2 py-1">
                            Add Event
                        </button>
                    </div>
                </form>
            )}
        </div>
    );
};

export default Schedule;
