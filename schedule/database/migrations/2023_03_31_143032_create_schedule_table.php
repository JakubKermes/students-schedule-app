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
        Schema::create('schedule', function (Blueprint $table) {
            $table->integer('id_lecture', true);
            $table->integer('id_lecturer')->index('id_lecturer');
            $table->integer('id_group')->index('id_group');
            $table->integer('id_room')->index('id_room');
            $table->dateTime('time_start');
            $table->dateTime('time_end');
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
};
