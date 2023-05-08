<?php

namespace App\Console\Commands;

use App\Models\LectureSchedule;
use Illuminate\Console\Command;
use App\Models\*;

class RefreshSchedule extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:refresh-schedule';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        LectureSchedule::truncate(); // Clear the table

        $baseUrl = config('app.url'); // Get the base URL of your Laravel app

        // Call the /enter_specialisation route
        $response1 = Http::get("{$baseUrl}/enter_specialisation");
        // You can check the response, log errors, etc. if needed

        // Call the /scrap_schedule route
        $response2 = Http::get("{$baseUrl}/scrap_schedule");
        // You can check the response, log errors, etc. if needed

        // Call the /get_lecturers route
        $response3 = Http::get("{$baseUrl}/get_lecturers");
        // You can check the response, log errors, etc. if needed
    }

}
