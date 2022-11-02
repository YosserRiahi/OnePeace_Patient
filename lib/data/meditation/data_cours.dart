// ignore_for_file: public_member_api_docs, sort_constructors_first
class Course {
  String title;
  String steps;
  Course({
    required this.title,
    required this.steps,
  });
}

List<Course> data = [
  Course(title: "follow your breath mindfully:", steps: '''
- Bring your attention to your breathing.
- Focus your breath, and experience the air flowing in and out of your nostrils.
- Observe the rise and fall of your chest and the filling and emptying of your stomach area.
- Bring your awareness to the ebb, flow, and rhythm of your breath.
Don’t:
Deliberately breathe deep or slow or hard — breathe normally.
Hold your breath.
'''),
  Course(title: " Relax:", steps: '''
- We have a tendency to store tension in the shoulders, back, neck, and legs.
- Bring your awareness to any tension, ache, or pain in any parts of your body.
- When you breathe out, feel the tension ebbing away from your body.
- Continue to breathe gently, and observe your breath.
- With every exhalation, let go of your tension, until you feel relaxed.
- The more often you practise, the quicker and easier it will be to release tension and sink into a relaxed state
'''),
  Course(title: "focus your attention:", steps: '''
- One of the most challenging aspects of meditation is mastering discipline, self-control, and focus.
- Start by focusing your awareness on a candle flame, a flower, or a mantra: a sound or word that you repeat.
- If you get distracted by a noise, an itch, or a random thought, bring your attention back to your breath.
- It’s normal to feel frustrated or struggle to bring your awareness back — it may keep wandering.
- However, as you get better at meditating, your thoughts will be much more stable.

'''),
  Course(title: "Expand your awareness:", steps: '''
* Learn to be in the present moment, without rehashing the past or worrying about the future.
* If such thoughts intrude, observe them, and allow them to just pass through you.
* Do not judge or engage with your thoughts as either good or bad or either right or wrong.
* Remind yourself that your thoughts don’t define you, this is a very important step for releasing tension.
* Recurring thoughts hold the key to our innermost fears and beliefs, observation releases your potential.
* Watching your thoughts come and go, without judgment, helps you understand emotions and behavior.
* If you watch the workings of the inner mind, the same thought patterns will keep repeating themselves.
'''),
];

List<String> images = [
  "assets/categorie/sea.jpg",
  "assets/categorie/mountains.jpg",
  "assets/categorie/forest.jpg"
];
