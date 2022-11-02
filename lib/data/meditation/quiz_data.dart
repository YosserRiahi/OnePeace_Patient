// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final int id, answers;
  final List<String> options;
  final String question;
  Question({
    required this.id,
    required this.answers,
    required this.options,
    required this.question,
  });
}

List<Question> dataQuiz = [
  Question(
      id: 1,
      answers: 4,
      options: ["HRM", "zazen", "transcendantal", "Qigong"],
      question:
          "Which one of these is a meditation form that is highly specialised and requires specialist aid to perform?"),
  Question(
      id: 2,
      answers: 3,
      options: ["meditation", "respiration", "discipline", "pratice"],
      question:
          " Mastering __________ is one of the most challenging parts of meditation."),
  Question(
      id: 3,
      answers: 3,
      options: ["dislocated shoulder", "sprained ankle", "ulcer", "broken leg"],
      question:
          "Which of the following can be classified as a stress-related disorder?"),
  Question(
      id: 4,
      answers: 2,
      options: [
        "observe the stars",
        "clear your mind by taking a few breaths",
        "drink water ",
        "eat "
      ],
      question:
          "Which one of the following should you do before starting visualisation meditation?"),
  Question(
      id: 5,
      answers: 3,
      options: ["adrenaline", "cortisols", "cytokines", "Endorphins"],
      question:
          "Meditation can reduce the release of inflammation-causing chemicals known as _________."),
  Question(
      id: 6,
      answers: 4,
      options: [
        "stop at minute intervals",
        "Pray daily",
        "Run every morning",
        "Practise regularly"
      ],
      question:
          "In order to maximise the benefits of meditation, the individual must ________  _________."),
  Question(
      id: 7,
      answers: 1,
      options: [
        "find a noisy place to practise",
        "you can meditate at any time of the day",
        "clear the place of clutter and mess"
      ],
      question:
          "When finding the right place and time for meditation, which one of these is not true?"),
  Question(
      id: 8,
      answers: 3,
      options: [
        "increased self-awareness",
        "improved creativity and mental agility",
        "reduced cholesterol levels"
      ],
      question: "Which of these is a physical benefit of meditation?"),
  Question(
      id: 9,
      answers: 1,
      options: [
        "posture will depend on body type and constitution",
        "you must lean against a cushion ",
        "you must arch your back",
      ],
      question:
          "Which one of these statements are true when assuming a posture for meditation?"),
  Question(
      id: 10,
      answers: 2,
      options: [
        "meditation can be performed anywhere",
        "you need to change your religion in order to practise meditation",
        "meditation can help releive stress"
      ],
      question:
          "Which one of the following statements about meditation are wrong?"),
  Question(
      id: 11,
      answers: 2,
      options: ["mental", "Emotional", "spiritual", "physical"],
      question:
          "The production of serotonin, a mood-enhancing chemical in the body, is considered as a/an _________ benefit."),
  Question(
      id: 12,
      answers: 1,
      options: ["visualisation", "meditation", "concentration", "adaptation"],
      question:
          "When meditation involves the specific focus on something whether that be a concept, an object, or a person, it is referred to as __________."),
  Question(
      id: 13,
      answers: 3,
      options: [
        "sing a song ",
        "Resist your thoughts",
        "simply bring your attention back to meditating",
        "start following your thoughts"
      ],
      question: "What should you do when your mind wanders?"),
  Question(
      id: 14,
      answers: 3,
      options: [
        "calms your breathing",
        "helps inscrease energy levels",
        "reduces the release of cortisol"
      ],
      question: "Which of these is not a physical benefit of meditation?"),
  Question(
      id: 15,
      answers: 2,
      options: [
        "adaptive functions",
        "memory and learning",
        "cognitive functions",
        "muscular functions"
      ],
      question:
          "Meditation helps boost the grey area in the hippocampus area of the brain, which is responsible for _____________.")
];
