<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFieldOfStudyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('field_of_study', function (Blueprint $table) {
            $table->integer('id_group')->primary();
            $table->integer('id_faculty');
            $table->text('fos');
            $table->integer('year');
            $table->boolean('stationary')->default(1);
            $table->text('specialisation');
            $table->text('spec_group');
            
            $table->unique(['id_faculty', 'fos', 'year', 'stationary', 'specialisation', 'spec_group'], 'unique_fos_data');
            $table->foreign('id_faculty', 'field_of_study_ibfk_1')->references('id_faculty')->on('faculty')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('field_of_study');
    }
}
