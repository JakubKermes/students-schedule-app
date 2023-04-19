<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScheduleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedule', function (Blueprint $table) {
            $table->integer('id_lecture')->primary();
            $table->integer('id_lecturer');
            $table->integer('id_group');
            $table->integer('id_room');
            $table->dateTime('time_start');
            $table->dateTime('time_end');
            
            $table->foreign('id_lecturer', 'schedule_ibfk_1')->references('id_lecturer')->on('lecturers');
            $table->foreign('id_group', 'schedule_ibfk_2')->references('id_group')->on('field_of_study');
            $table->foreign('id_room', 'schedule_ibfk_3')->references('id_room')->on('clasrooms');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('schedule');
    }
}
