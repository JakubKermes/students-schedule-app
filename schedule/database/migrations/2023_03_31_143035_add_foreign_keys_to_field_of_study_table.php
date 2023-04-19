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
        Schema::table('field_of_study', function (Blueprint $table) {
            $table->foreign(['id_faculty'], 'field_of_study_ibfk_1')->references(['id_faculty'])->on('faculty')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('field_of_study', function (Blueprint $table) {
            $table->dropForeign('field_of_study_ibfk_1');
        });
    }
};
