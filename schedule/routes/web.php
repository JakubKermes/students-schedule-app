<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\StudentGroupSelectionController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/crawl', function () {
    require_once app_path('crawlSite/URLScraper.php');
});

Route::get('/enter_specialisation', function () {
    require_once app_path('crawlSite/enterSpecialisation.php');
});

Route::get('/scrap_schedule', function () {
    require_once app_path('crawlSite/scrapSchedule.php');
});
Route::get('/get_lecturers', function () {
    require_once app_path('crawlSite/updateLecturersAtCollegium.php');
});


Route::get('/get_faculties', [StudentGroupSelectionController::class, 'getFaculties']);
Route::get('/get_fos/{id_faculty}', [StudentGroupSelectionController::class, 'getFOS']);
Route::get('/get_year/{id_faculty}/{fos}', [StudentGroupSelectionController::class, 'getYear']);
Route::get('/get_specialisation/{id_faculty}/{fos}/{year}', [StudentGroupSelectionController::class, 'getSpecialisation']);
Route::get('/get_stationary/{id_faculty}/{fos}/{year}/{specialisation}', [StudentGroupSelectionController::class, 'getStationary']);
Route::get('/get_spec_group/{id_faculty}/{fos}/{year}/{specialisation}/{stationary}', [StudentGroupSelectionController::class, 'getSpecGroup']);
Route::get('/get_group/{id_faculty}/{fos}/{year}/{specialisation}/{spec_group}/{stationary}', [StudentGroupSelectionController::class, 'getGroup']);

Route::get('/get_schedule/{id_group}', [App\Http\Controllers\ScheduleController::class, 'getSchedule']);


require __DIR__.'/auth.php';
