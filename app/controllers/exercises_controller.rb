class ExercisesController < ApplicationController

	before_action :find_exercise , only: [:update , :destroy]

	def create
		@workout = Workout.find(params[:workout_id])
		@exercise = @workout.exercises.create(exercise_params)
		redirect_to workout_path(@workout)	
	end

	def edit
		@workout = Workout.find(params[:workout_id])
		@exercise = Exercise.find(params[:id])
	end

	def update
		@workout = Workout.find(params[:workout_id])
		if @exercise.update(exercise_params)
			redirect_to @workout
		else 
			render 'edit'
		end
	end

	def destroy
		@workout = Workout.find(params[:workout_id])
		@exercise.destroy
		redirect_to @workout
	end


	private

	def exercise_params
		params.require(:exercise).permit(:name,:sets,:reps)
	end

	def find_exercise
		@exercise = Exercise.find(params[:id])
	end

end
