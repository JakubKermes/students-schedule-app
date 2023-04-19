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
        Schema::create('field_of_study', function (Blueprint $table) {
            $table->integer('id_group', true);
            $table->integer('id_faculty')->index('id_faculty');
            $table->text('fos');
            $table->integer('year');
            $table->boolean('stationary')->default(true);
            $table->text('specialisation');
            $table->text('spec_group');

            $table->unique(['id_faculty', 'fos', 'year', 'stationary', 'specialisation', 'spec_group'], 'unique_fos_data');
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
};
