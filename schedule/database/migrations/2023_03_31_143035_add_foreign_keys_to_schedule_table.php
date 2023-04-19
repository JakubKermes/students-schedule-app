<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('schedule', function (Blueprint $table) {
            $table->foreign(['id_lecturer'], 'schedule_ibfk_1')->references(['id_lecturer'])->on('lecturers');
            $table->foreign(['id_room'], 'schedule_ibfk_3')->references(['id_room'])->on('clasrooms');
            $table->foreign(['id_group'], 'schedule_ibfk_2')->references(['id_group'])->on('field_of_study');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('schedule', function (Blueprint $table) {
            $table->dropForeign('schedule_ibfk_1');
            $table->dropForeign('schedule_ibfk_3');
            $table->dropForeign('schedule_ibfk_2');
        });
    }
};
