import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';
import 'package:redux/redux.dart';

StackOverflowState loadQuestions(
    StackOverflowState state, LoadQuestionActionSuccessAction action) {
  return state.copyWith(q: action.questions);
}

StackOverflowState viewQuestion(
    StackOverflowState state, ViewQuestionActionAction action) {
  return state.copyWith(s: action.question);
}

StackOverflowState deleteQuestion(
    StackOverflowState state, DeleteQuestionActionAction action) {
  return state.copyWith(
    q: state.questions
        .where((q) => q.questionId != action.question.questionId)
        .toList(),
  );
}

final Reducer<StackOverflowState> stackOverflowReducer =
    combineReducers<StackOverflowState>([
  new TypedReducer<StackOverflowState, LoadQuestionActionSuccessAction>(
      loadQuestions),
  new TypedReducer<StackOverflowState, DeleteQuestionActionAction>(
      deleteQuestion),
  new TypedReducer<StackOverflowState, ViewQuestionActionAction>(viewQuestion),
]);