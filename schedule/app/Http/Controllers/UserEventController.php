<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserEvent;
use Illuminate\Support\Facades\Validator;

class UserEventController extends Controller
{
    // Add user event from frontend
    public function store(Request $request)
    {
        // Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'id_laravel_user' => 'required|exists:users,id',
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

        // Save the new UserEvent to the database
        if ($userEvent->save()) {
            return response()->json(['success' => 'User event added successfully'], 201);
        } else {
            return response()->json(['error' => 'Failed to add user event'], 500);
        }
    }
}
