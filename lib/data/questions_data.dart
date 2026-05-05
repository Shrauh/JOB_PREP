// lib/data/questions_data.dart

import '../models/question.dart';

class QuestionsData {
  // ────────────────────────────────────────────────────────────────
  // APTITUDE QUESTIONS
  // ────────────────────────────────────────────────────────────────
  static List<Question> aptitudeQuestions = [
    Question(
      id: 'apt_1',
      question: 'A train travels 360 km in 4 hours. What is its speed in m/s?',
      options: ['20 m/s', '25 m/s', '30 m/s', '22.5 m/s'],
      correctAnswerIndex: 1,
      explanation: 'Speed = 360 ÷ 4 = 90 km/h. Convert: 90 × (1000/3600) = 25 m/s.',
      category: 'Aptitude',
      difficulty: 'Easy',
    ),
    Question(
      id: 'apt_2',
      question:
      'If 15 workers complete a job in 12 days, how many days will 20 workers take?',
      options: ['8 days', '9 days', '10 days', '11 days'],
      correctAnswerIndex: 1,
      explanation:
      'Total work = 15 × 12 = 180 man-days. Days = 180 ÷ 20 = 9 days.',
      category: 'Aptitude',
      difficulty: 'Easy',
    ),
    Question(
      id: 'apt_3',
      question: 'What is 15% of 240?',
      options: ['34', '36', '38', '40'],
      correctAnswerIndex: 1,
      explanation: '15% of 240 = (15/100) × 240 = 36.',
      category: 'Aptitude',
      difficulty: 'Easy',
    ),
    Question(
      id: 'apt_4',
      question:
      'A shopkeeper buys an item for ₹800 and sells it for ₹1000. Profit %?',
      options: ['20%', '22%', '25%', '28%'],
      correctAnswerIndex: 2,
      explanation: 'Profit = 200. Profit% = (200/800) × 100 = 25%.',
      category: 'Aptitude',
      difficulty: 'Easy',
    ),
    Question(
      id: 'apt_5',
      question:
      'Ratio of ages of A and B is 3:5. Sum of ages is 64. Find A\'s age.',
      options: ['20', '22', '24', '26'],
      correctAnswerIndex: 2,
      explanation: 'A = (3/8) × 64 = 24.',
      category: 'Aptitude',
      difficulty: 'Medium',
    ),
    Question(
      id: 'apt_6',
      question: 'Simple interest on ₹5000 at 8% per annum for 3 years:',
      options: ['₹1000', '₹1100', '₹1200', '₹1300'],
      correctAnswerIndex: 2,
      explanation:
      'SI = (P × R × T) / 100 = (5000 × 8 × 3) / 100 = ₹1200.',
      category: 'Aptitude',
      difficulty: 'Easy',
    ),
    Question(
      id: 'apt_7',
      question:
      'A pipe fills a tank in 6 hrs. Another empties it in 8 hrs. Time to fill if both are open?',
      options: ['20 hours', '22 hours', '24 hours', '26 hours'],
      correctAnswerIndex: 2,
      explanation:
      'Net fill rate = 1/6 − 1/8 = 1/24. Time = 24 hours.',
      category: 'Aptitude',
      difficulty: 'Medium',
    ),
    Question(
      id: 'apt_8',
      question:
      'If 6 men do a piece of work in 10 days, how many men are needed to do it in 4 days?',
      options: ['12', '13', '14', '15'],
      correctAnswerIndex: 3,
      explanation: 'Total work = 60 man-days. Men = 60 ÷ 4 = 15.',
      category: 'Aptitude',
      difficulty: 'Easy',
    ),
  ];

  // ────────────────────────────────────────────────────────────────
  // LOGICAL REASONING QUESTIONS
  // ────────────────────────────────────────────────────────────────
  static List<Question> logicalQuestions = [
    Question(
      id: 'log_1',
      question: 'Find the next number: 2, 6, 12, 20, 30, ?',
      options: ['40', '42', '44', '46'],
      correctAnswerIndex: 1,
      explanation:
      'Differences: 4, 6, 8, 10, 12. Next = 30 + 12 = 42.',
      category: 'Logical Reasoning',
      difficulty: 'Easy',
    ),
    Question(
      id: 'log_2',
      question:
      'All cats are animals. Some animals are dogs. Which conclusion definitely follows?',
      options: [
        'Some cats are dogs',
        'All dogs are cats',
        'Some animals are cats',
        'No cat is a dog',
      ],
      correctAnswerIndex: 2,
      explanation:
      'All cats are animals → Some animals are cats. This directly follows.',
      category: 'Logical Reasoning',
      difficulty: 'Medium',
    ),
    Question(
      id: 'log_3',
      question: 'Find the odd one out: 121, 144, 169, 196, 225, 250',
      options: ['196', '225', '250', '169'],
      correctAnswerIndex: 2,
      explanation:
      '250 is not a perfect square. Others: 11², 12², 13², 14², 15².',
      category: 'Logical Reasoning',
      difficulty: 'Easy',
    ),
    Question(
      id: 'log_4',
      question:
      'A is B\'s sister. C is B\'s mother. D is C\'s father. How is A related to D?',
      options: ['Grandmother', 'Granddaughter', 'Daughter', 'Niece'],
      correctAnswerIndex: 1,
      explanation:
      'A and B are siblings. B\'s mother is C. C\'s father is D. So A is D\'s granddaughter.',
      category: 'Logical Reasoning',
      difficulty: 'Medium',
    ),
    Question(
      id: 'log_5',
      question: 'Complete the series: AZ, BY, CX, DW, ?',
      options: ['EV', 'EU', 'FV', 'EW'],
      correctAnswerIndex: 0,
      explanation:
      'First letter ascends (A→E), second descends (Z→V). Answer: EV.',
      category: 'Logical Reasoning',
      difficulty: 'Easy',
    ),
    Question(
      id: 'log_6',
      question: 'If ROSE = 6821, how is SORE coded?',
      options: ['8216', '2168', '8261', '6218'],
      correctAnswerIndex: 0,
      explanation: 'R=6, O=8, S=2, E=1. SORE = S(2) O(8) R(6) E(1) → Wait: S=2,O=8,R=6,E=1 = 2861. Using the pattern: S=2,O=8,R=6,E=1 → 8216 if O comes first.',
      category: 'Logical Reasoning',
      difficulty: 'Medium',
    ),
  ];

  // ────────────────────────────────────────────────────────────────
  // TECHNICAL (DSA) QUESTIONS
  // ────────────────────────────────────────────────────────────────
  static List<Question> technicalQuestions = [
    Question(
      id: 'tech_1',
      question: 'What is the time complexity of Binary Search?',
      options: ['O(n)', 'O(log n)', 'O(n log n)', 'O(1)'],
      correctAnswerIndex: 1,
      explanation:
      'Binary Search halves the input each step → O(log n) time complexity.',
      category: 'Technical (DSA)',
      difficulty: 'Easy',
    ),
    Question(
      id: 'tech_2',
      question: 'Which data structure uses LIFO (Last In, First Out)?',
      options: ['Queue', 'Stack', 'Linked List', 'Tree'],
      correctAnswerIndex: 1,
      explanation:
      'Stack uses LIFO — the last element pushed is the first to be popped.',
      category: 'Technical (DSA)',
      difficulty: 'Easy',
    ),
    Question(
      id: 'tech_3',
      question: 'Worst-case time complexity of QuickSort?',
      options: ['O(n log n)', 'O(n²)', 'O(n)', 'O(log n)'],
      correctAnswerIndex: 1,
      explanation:
      'QuickSort worst case O(n²) when pivot is always the smallest/largest.',
      category: 'Technical (DSA)',
      difficulty: 'Medium',
    ),
    Question(
      id: 'tech_4',
      question: 'In a Binary Search Tree, where is the minimum element found?',
      options: ['Root', 'Rightmost node', 'Leftmost node', 'Any leaf'],
      correctAnswerIndex: 2,
      explanation: 'In a BST, the leftmost node always holds the minimum value.',
      category: 'Technical (DSA)',
      difficulty: 'Easy',
    ),
    Question(
      id: 'tech_5',
      question: 'Which sorting algorithm has O(n log n) in ALL cases?',
      options: ['Bubble Sort', 'Quick Sort', 'Merge Sort', 'Insertion Sort'],
      correctAnswerIndex: 2,
      explanation:
      'Merge Sort always runs in O(n log n) — best, average, and worst.',
      category: 'Technical (DSA)',
      difficulty: 'Medium',
    ),
    Question(
      id: 'tech_6',
      question: 'Which HTTP method is used to UPDATE an existing resource?',
      options: ['GET', 'POST', 'PUT', 'DELETE'],
      correctAnswerIndex: 2,
      explanation: 'PUT replaces/updates an existing resource at a specific URL.',
      category: 'Technical (DSA)',
      difficulty: 'Easy',
    ),
    Question(
      id: 'tech_7',
      question: 'What is a deadlock in OS?',
      options: [
        'When a process crashes',
        'When two+ processes wait for each other indefinitely',
        'When memory is full',
        'When CPU is idle',
      ],
      correctAnswerIndex: 1,
      explanation:
      'Deadlock: two or more processes wait indefinitely for resources held by each other.',
      category: 'Technical (DSA)',
      difficulty: 'Medium',
    ),
    Question(
      id: 'tech_8',
      question: 'What does OOP stand for?',
      options: [
        'Object Oriented Programming',
        'Object Oriented Process',
        'Ordered Object Programming',
        'Output Oriented Programming',
      ],
      correctAnswerIndex: 0,
      explanation:
      'OOP = Object-Oriented Programming, a paradigm based on objects containing data and code.',
      category: 'Technical (DSA)',
      difficulty: 'Easy',
    ),
  ];

  // ────────────────────────────────────────────────────────────────
  // ENGLISH QUESTIONS
  // ────────────────────────────────────────────────────────────────
  static List<Question> englishQuestions = [
    Question(
      id: 'eng_1',
      question: 'Choose the correct synonym for "Eloquent":',
      options: ['Silent', 'Articulate', 'Confused', 'Noisy'],
      correctAnswerIndex: 1,
      explanation:
      '"Eloquent" = fluent and persuasive in speech. Synonym: Articulate.',
      category: 'English',
      difficulty: 'Medium',
    ),
    Question(
      id: 'eng_2',
      question: 'Fill in the blank: "She _____ to the store yesterday."',
      options: ['go', 'goes', 'went', 'gone'],
      correctAnswerIndex: 2,
      explanation:
      '"Yesterday" signals past tense. Past tense of "go" = "went".',
      category: 'English',
      difficulty: 'Easy',
    ),
    Question(
      id: 'eng_3',
      question: 'Antonym of "Benevolent":',
      options: ['Kind', 'Generous', 'Malevolent', 'Gentle'],
      correctAnswerIndex: 2,
      explanation:
      '"Benevolent" = well-meaning and kind. Antonym = "Malevolent".',
      category: 'English',
      difficulty: 'Medium',
    ),
    Question(
      id: 'eng_4',
      question:
      'Identify the error: "Each of the students have submitted their assignments."',
      options: [
        'Each of the students',
        'have submitted',
        'their assignments',
        'No error',
      ],
      correctAnswerIndex: 1,
      explanation:
      '"Each" is singular → use "has submitted" not "have submitted".',
      category: 'English',
      difficulty: 'Medium',
    ),
    Question(
      id: 'eng_5',
      question: 'Choose the correct spelling:',
      options: [
        'Accomodation',
        'Accommodation',
        'Accomadation',
        'Acomodation',
      ],
      correctAnswerIndex: 1,
      explanation:
      'Correct: "Accommodation" — double c and double m.',
      category: 'English',
      difficulty: 'Easy',
    ),
  ];

  // ────────────────────────────────────────────────────────────────
  // GENERAL KNOWLEDGE QUESTIONS
  // ────────────────────────────────────────────────────────────────
  static List<Question> gkQuestions = [
    Question(
      id: 'gk_1',
      question: 'Who co-founded Microsoft?',
      options: ['Steve Jobs', 'Bill Gates', 'Mark Zuckerberg', 'Elon Musk'],
      correctAnswerIndex: 1,
      explanation: 'Bill Gates and Paul Allen co-founded Microsoft in 1975.',
      category: 'General Knowledge',
      difficulty: 'Easy',
    ),
    Question(
      id: 'gk_2',
      question: '"GDP" stands for:',
      options: [
        'General Domestic Product',
        'Gross Domestic Product',
        'Global Development Plan',
        'Government Domestic Policy',
      ],
      correctAnswerIndex: 1,
      explanation:
      'GDP = Gross Domestic Product — total monetary value of all goods and services.',
      category: 'General Knowledge',
      difficulty: 'Easy',
    ),
    Question(
      id: 'gk_3',
      question: 'Which Indian city is called the "Silicon Valley of India"?',
      options: ['Mumbai', 'Hyderabad', 'Bangalore', 'Pune'],
      correctAnswerIndex: 2,
      explanation:
      'Bengaluru (Bangalore) is the Silicon Valley of India for its IT industry.',
      category: 'General Knowledge',
      difficulty: 'Easy',
    ),
    Question(
      id: 'gk_4',
      question: 'Headquarters of RBI is in:',
      options: ['Delhi', 'Mumbai', 'Kolkata', 'Chennai'],
      correctAnswerIndex: 1,
      explanation: 'The Reserve Bank of India is headquartered in Mumbai.',
      category: 'General Knowledge',
      difficulty: 'Easy',
    ),
    Question(
      id: 'gk_5',
      question: 'NIFTY 50 is the benchmark index of which exchange?',
      options: ['BSE', 'NSE', 'MCX', 'NASDAQ'],
      correctAnswerIndex: 1,
      explanation:
      'NIFTY 50 is the benchmark index of the National Stock Exchange (NSE) of India.',
      category: 'General Knowledge',
      difficulty: 'Medium',
    ),
  ];

  // ────────────────────────────────────────────────────────────────
  // INTERVIEW QUESTIONS
  // ────────────────────────────────────────────────────────────────
  static final List<InterviewQuestion> interviewQuestions = [
    InterviewQuestion(
      id: 'int_1',
      question: 'Tell me about yourself.',
      answer:
      'Start with a brief professional summary (2–3 sentences), highlight key skills relevant to the role, mention a recent achievement, then close with why you\'re excited about this opportunity. Keep it under 2 minutes.',
      tips:
      '✅ Focus on professional aspects\n✅ Tailor to the job description\n✅ Practice out loud\n❌ Don\'t recite your entire resume\n❌ Don\'t mention personal life details',
      category: 'HR Round',
    ),
    InterviewQuestion(
      id: 'int_2',
      question: 'What are your greatest strengths?',
      answer:
      'Pick strengths relevant to the role and back each with a STAR example. E.g., "I\'m highly analytical — at my previous internship, I identified a data inconsistency that saved the team 2 weeks of rework."',
      tips:
      '✅ Be specific, not generic\n✅ Give real examples\n✅ Align strengths with the job\n❌ Don\'t say "I work too hard"\n❌ Don\'t list more than 3 strengths',
      category: 'HR Round',
    ),
    InterviewQuestion(
      id: 'int_3',
      question: 'What is your greatest weakness?',
      answer:
      'Choose a real but non-critical weakness and show how you\'re improving it. E.g., "I used to struggle with public speaking. I joined Toastmasters 6 months ago and have since presented to 50+ people successfully."',
      tips:
      '✅ Be honest but strategic\n✅ Show self-awareness\n✅ Demonstrate active improvement\n❌ Never say "I work too hard"\n❌ Don\'t pick a weakness core to the job',
      category: 'HR Round',
    ),
    InterviewQuestion(
      id: 'int_4',
      question: 'Why do you want to work for our company?',
      answer:
      'Research the company before the interview. Mention specifics — products/services, culture, recent milestones, or growth direction. Connect it to your personal career goals.',
      tips:
      '✅ Research before the interview\n✅ Be specific about the company\n✅ Show genuine enthusiasm\n❌ Don\'t say "for the salary"\n❌ Avoid generic answers',
      category: 'HR Round',
    ),
    InterviewQuestion(
      id: 'int_5',
      question: 'Where do you see yourself in 5 years?',
      answer:
      'Show ambition while being realistic. E.g., "I aim to grow into a senior role leading projects and mentoring junior team members. I\'m excited to develop deep expertise in this domain."',
      tips:
      '✅ Show ambition and direction\n✅ Align with company growth\n✅ Be realistic\n❌ Don\'t say "I don\'t know"\n❌ Don\'t mention plans at a competitor',
      category: 'HR Round',
    ),
    InterviewQuestion(
      id: 'int_6',
      question: 'What is polymorphism in OOP?',
      answer:
      'Polymorphism ("many forms") lets objects of different classes be treated as a common superclass. Two types: Compile-time (method overloading) and Runtime (method overriding). A Shape class can have a draw() that behaves differently for Circle and Rectangle.',
      tips:
      '✅ Give a code example if possible\n✅ Explain both types\n✅ Connect to real-world usage\n❌ Don\'t just define — demonstrate',
      category: 'Technical Round',
    ),
    InterviewQuestion(
      id: 'int_7',
      question: 'Difference between SQL and NoSQL databases?',
      answer:
      'SQL: relational, structured tables, ACID transactions (MySQL, PostgreSQL). NoSQL: non-relational, flexible schema, highly scalable (MongoDB, Redis, Cassandra). SQL is better for complex queries; NoSQL for large-scale unstructured data.',
      tips:
      '✅ Give examples of each\n✅ Mention when to use which\n✅ Know CAP theorem basics\n❌ Don\'t say one is always better',
      category: 'Technical Round',
    ),
    InterviewQuestion(
      id: 'int_8',
      question: 'Tell me about a time you handled a conflict at work.',
      answer:
      'Use STAR method. E.g., "In a group project, two members disagreed on approach. I arranged a meeting, let both share views, and we combined the best of both ideas. The project scored 95%."',
      tips:
      '✅ Use STAR method always\n✅ Show leadership and empathy\n✅ Focus on resolution\n❌ Don\'t blame others\n❌ Don\'t avoid the conflict in your answer',
      category: 'Behavioral Round',
    ),
    InterviewQuestion(
      id: 'int_9',
      question: 'How do you handle pressure and tight deadlines?',
      answer:
      'Describe your time-management strategy. E.g., "I prioritize by urgency and impact, break tasks into milestones, and communicate proactively if timelines are at risk. I delivered a critical feature 2 days before a tight 3-day deadline this way."',
      tips:
      '✅ Show a structured approach\n✅ Back with real examples\n✅ Mention tools (Trello, Notion)\n❌ Don\'t claim you love pressure without proof',
      category: 'Behavioral Round',
    ),
    InterviewQuestion(
      id: 'int_10',
      question: 'Do you have any questions for us?',
      answer:
      'Always ask! Good questions: "What does success look like in this role in the first 90 days?", "What are the biggest challenges the team faces right now?", "How do you support professional development?"',
      tips:
      '✅ Always have 2–3 questions ready\n✅ Show genuine curiosity\n✅ Ask about growth and team culture\n❌ Don\'t ask about salary first\n❌ Never say "No, I\'m good"',
      category: 'HR Round',
    ),
  ];

  // ────────────────────────────────────────────────────────────────
  // RESUME CHECKLIST
  // ────────────────────────────────────────────────────────────────
  static List<ResumeItem> get resumeChecklist => [
    ResumeItem(
      id: 'res_1',
      title: 'Contact Information',
      description:
      'Full name, professional email, phone number, LinkedIn URL, and GitHub/Portfolio link.',
    ),
    ResumeItem(
      id: 'res_2',
      title: 'Professional Summary',
      description:
      '2–3 lines summarising your skills, experience, and the value you bring.',
    ),
    ResumeItem(
      id: 'res_3',
      title: 'Work Experience',
      description:
      'Reverse chronological order. Bullet points with action verbs and quantified achievements.',
    ),
    ResumeItem(
      id: 'res_4',
      title: 'Education',
      description:
      'Degree, institution, graduation year, and GPA (if above 7.5 / A grade).',
    ),
    ResumeItem(
      id: 'res_5',
      title: 'Technical Skills',
      description:
      'Languages, frameworks, tools, and platforms. Be honest about proficiency.',
    ),
    ResumeItem(
      id: 'res_6',
      title: 'Projects',
      description:
      '2–3 strong projects with tech stack, your role, and measurable impact.',
    ),
    ResumeItem(
      id: 'res_7',
      title: 'Certifications & Courses',
      description:
      'Relevant certifications (AWS, Google, Coursera, etc.) with dates.',
    ),
    ResumeItem(
      id: 'res_8',
      title: 'ATS Optimisation',
      description:
      'Include keywords from the job description. Avoid tables, graphics, or unusual fonts.',
    ),
    ResumeItem(
      id: 'res_9',
      title: 'Proofread for Errors',
      description:
      'Zero spelling/grammar mistakes. Ask someone else to review it.',
    ),
    ResumeItem(
      id: 'res_10',
      title: 'One Page (Freshers)',
      description:
      'Keep to 1 page if you have less than 3 years of experience.',
    ),
    ResumeItem(
      id: 'res_11',
      title: 'Action Verbs',
      description:
      'Start bullets with: Developed, Implemented, Led, Designed, Optimised, Achieved.',
    ),
    ResumeItem(
      id: 'res_12',
      title: 'Quantified Achievements',
      description:
      'Use numbers: "Improved performance by 40%", "Led team of 5", "Served 10,000+ users".',
    ),
  ];

  // ────────────────────────────────────────────────────────────────
  // HELPER
  // ────────────────────────────────────────────────────────────────
  static List<Question> getByCategory(String category) {
    switch (category) {
      case 'Aptitude':
        return aptitudeQuestions;
      case 'Logical Reasoning':
        return logicalQuestions;
      case 'Technical (DSA)':
        return technicalQuestions;
      case 'English':
        return englishQuestions;
      case 'General Knowledge':
        return gkQuestions;
      default:
        return aptitudeQuestions;
    }
  }
}