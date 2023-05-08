<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserEvent;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;


class UserEventController extends Controller
{
    // Add user event from frontend
    public function store(Request $request)
    {
        $id_laravel_user = Auth::id();
        // Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'event_name' => 'required|string',
            'time_start' => 'required|date',
            'time_end' => 'required|date|after:time_start',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Create a new UserEvent instance
        $userEvent = new UserEvent();
        $userEvent->fill($request->all());
        $userEvent->id_laravel_user = $id_laravel_user;

        // Save the new UserEvent to the database
        if ($userEvent->save()) {
            return response()->json(['success' => 'User event added successfully'], 201);
        } else {
            return response()->json(['error' => 'Failed to add user event'], 500);
        }
    }

    public function getEvents()
    {
        $id_laravel_user = Auth::id();
        $userEvents = UserEvent::where('id_laravel_user', $id_laravel_user)->get();
        return response()->json($userEvents, 200, [], JSON_UNESCAPED_UNICODE);
    }
}
