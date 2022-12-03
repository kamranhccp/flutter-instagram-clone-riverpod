// specify authentication results to tell user about the result of authentication
// 1. either success (user is authenticated) means that user is authenticated
// 2. or failure (user is not authenticated) meaning that user is not authenticated
// 3. or aborted (user aborted the authentication process) meaning user did not complete the authentication process

// enum is a special data type in dart that allows us to define a fixed set of constants
// we can use enum to define a set of constants that are related to each other
enum AuthResults {
  aborted,
  success,
  failure,
}
