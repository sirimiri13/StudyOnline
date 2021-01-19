import 'dart:convert';

Exercises exercisesFromJson(String str) => Exercises.fromJson(json.decode(str));

String exercisesToJson(Exercises data) => json.encode(data.toJson());

class Exercises {
  Exercises({
    this.exercises,
  });

  ExercisesClass exercises;

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
    exercises: ExercisesClass.fromJson(json["Exercises"]),
  );

  Map<String, dynamic> toJson() => {
    "Exercises": exercises.toJson(),
  };
}

class ExercisesClass {
  ExercisesClass({
    this.exercises,
  });

  List<Exercise> exercises;

  factory ExercisesClass.fromJson(Map<String, dynamic> json) => ExercisesClass(
    exercises: List<Exercise>.from(json["exercises"].map((x) => Exercise.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
  };
}

class Exercise {
  Exercise({
    this.id,
    this.numberQuestion,
    this.title,
    this.exercisesQuestions,
    this.usersDoExercises,
  });

  String id;
  int numberQuestion;
  String title;
  List<ExercisesQuestion> exercisesQuestions;
  List<UsersDoExercise> usersDoExercises;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    numberQuestion: json["numberQuestion"],
    title: json["title"],
    exercisesQuestions: List<ExercisesQuestion>.from(json["exercises_questions"].map((x) => ExercisesQuestion.fromJson(x))),
    usersDoExercises: List<UsersDoExercise>.from(json["users_do_exercises"].map((x) => UsersDoExercise.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "numberQuestion": numberQuestion,
    "title": title,
    "exercises_questions": List<dynamic>.from(exercisesQuestions.map((x) => x.toJson())),
    "users_do_exercises": List<dynamic>.from(usersDoExercises.map((x) => x.toJson())),
  };
}

class ExercisesQuestion {
  ExercisesQuestion({
    this.id,
  });

  String id;

  factory ExercisesQuestion.fromJson(Map<String, dynamic> json) => ExercisesQuestion(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class UsersDoExercise {
  UsersDoExercise({
    this.score,
  });

  int score;

  factory UsersDoExercise.fromJson(Map<String, dynamic> json) => UsersDoExercise(
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "score": score,
  };
}