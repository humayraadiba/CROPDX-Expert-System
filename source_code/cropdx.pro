/* ============================================================
   CROP DISEASE DIAGNOSIS EXPERT SYSTEM
   File     : CROPDX.PRO
   Language : Turbo Prolog 2.0
   Student  : Humayra Adiba | ID: 22701050
   Course   : CSE 714 - AI Lab
   ============================================================ */

domains
  name   = string
  answer = string

predicates
  start
  main_menu
  select_crop(name)

  ask_rice(answer, answer, answer, answer, answer, answer)
  ask_potato(answer, answer, answer, answer, answer, answer)
  ask_tomato(answer, answer, answer, answer, answer, answer)
  ask_wheat(answer, answer, answer, answer, answer, answer)

  diagnose_rice(answer, answer, answer, answer, answer, answer)
  diagnose_potato(answer, answer, answer, answer, answer, answer)
  diagnose_tomato(answer, answer, answer, answer, answer, answer)
  diagnose_wheat(answer, answer, answer, answer, answer, answer)

  get_answer(answer)
  ask_question(name, answer)
  check_again(answer)

  show_result(name, name, name, name)
  show_unknown
  show_line
  show_header
  ask_again

clauses

/* ------------------------------------------------------------
   ENTRY POINT
   ------------------------------------------------------------ */

  start :-
    show_header,
    main_menu.

  show_header :-
    nl,
    write("============================================================"), nl,
    write("   CROP DISEASE DIAGNOSIS EXPERT SYSTEM                    "), nl,
    write("   AI Lab Project  |  Turbo Prolog 2.0                     "), nl,
    write("   Humayra Adiba   |  ID: 22701050                         "), nl,
    write("============================================================"), nl, nl.

  show_line :-
    write("------------------------------------------------------------"), nl.

/* ------------------------------------------------------------
   MAIN MENU
   ------------------------------------------------------------ */

  main_menu :-
    nl,
    write("Select your crop:"), nl,
    write("  rice / potato / tomato / wheat / exit"), nl, nl,
    write("Enter crop name: "),
    readln(CropName), nl,
    select_crop(CropName).

/* ------------------------------------------------------------
   CROP ROUTING
   ------------------------------------------------------------ */

  select_crop("rice") :-
    show_line,
    write("Crop selected: RICE"), nl,
    show_line,
    ask_rice(A1, A2, A3, A4, A5, A6),
    diagnose_rice(A1, A2, A3, A4, A5, A6).

  select_crop("potato") :-
    show_line,
    write("Crop selected: POTATO"), nl,
    show_line,
    ask_potato(B1, B2, B3, B4, B5, B6),
    diagnose_potato(B1, B2, B3, B4, B5, B6).

  select_crop("tomato") :-
    show_line,
    write("Crop selected: TOMATO"), nl,
    show_line,
    ask_tomato(C1, C2, C3, C4, C5, C6),
    diagnose_tomato(C1, C2, C3, C4, C5, C6).

  select_crop("wheat") :-
    show_line,
    write("Crop selected: WHEAT"), nl,
    show_line,
    ask_wheat(D1, D2, D3, D4, D5, D6),
    diagnose_wheat(D1, D2, D3, D4, D5, D6).

  select_crop("exit") :-
    nl,
    write("Goodbye! Thank you for using the system."), nl.

  select_crop(_) :-
    nl,
    write("Invalid input. Please type: rice, potato, tomato, wheat, or exit."), nl,
    main_menu.

/* ------------------------------------------------------------
   GET ANSWER
   ------------------------------------------------------------ */

  get_answer(Answer) :-
    readln(Answer), nl.

  ask_question(Question, Answer) :-
    write("  >> "), write(Question), nl,
    write("     (yes/no): "),
    get_answer(Answer).

/* ============================================================
   RICE QUESTIONS
   ============================================================ */

  ask_rice(A1, A2, A3, A4, A5, A6) :-
    nl,
    write("Answer each question with yes or no:"), nl, nl,
    ask_question("Do you see diamond-shaped spots on leaves?",       A1),
    ask_question("Are the spots gray or white in the center?",       A2),
    ask_question("Do the spots have brown or dark borders?",         A3),
    ask_question("Are the leaf tips turning yellow and wilting?",    A4),
    ask_question("Do you see water-soaked streaks on leaf margins?", A5),
    ask_question("Are leaves drying out from the tips downward?",    A6).

/* ------------------------------------------------------------
   FIX: Each diagnose clause is a SEPARATE clause.
   Turbo Prolog matches clauses top to bottom.
   Cut (!) stops searching after first match.
   ------------------------------------------------------------ */

  diagnose_rice("yes", "yes", "yes", _, _, _) :-
    show_result(
      "RICE BLAST",
      "Caused by fungus Magnaporthe oryzae.",
      "Apply Tricyclazole or Carbendazim. Remove infected parts.",
      "Use resistant varieties. Avoid excess nitrogen."
    ), !.

  diagnose_rice(_, _, _, "yes", "yes", "yes") :-
    show_result(
      "BACTERIAL LEAF BLIGHT",
      "Caused by Xanthomonas oryzae pv. oryzae.",
      "Apply copper-based bactericides. Remove infected leaves.",
      "Plant resistant varieties. Avoid waterlogging."
    ), !.

  diagnose_rice(_, _, _, _, _, _) :-
    show_unknown.

/* ============================================================
   POTATO QUESTIONS
   ============================================================ */

  ask_potato(B1, B2, B3, B4, B5, B6) :-
    nl,
    write("Answer each question with yes or no:"), nl, nl,
    ask_question("Do you see dark brown water-soaked patches on leaves?", B1),
    ask_question("Is there white mold visible under the leaves?",         B2),
    ask_question("Are tubers showing dark rotting areas inside?",         B3),
    ask_question("Do leaves show small brown spots with yellow rings?",   B4),
    ask_question("Are the spots surrounded by a yellow halo?",            B5),
    ask_question("Are older lower leaves affected first?",                B6).

  diagnose_potato("yes", "yes", "yes", _, _, _) :-
    show_result(
      "LATE BLIGHT",
      "Caused by Phytophthora infestans.",
      "Apply Mancozeb or Metalaxyl. Destroy infected tubers.",
      "Use certified disease-free seed. Improve drainage."
    ), !.

  diagnose_potato(_, _, _, "yes", "yes", "yes") :-
    show_result(
      "EARLY BLIGHT",
      "Caused by fungus Alternaria solani.",
      "Apply Chlorothalonil or Mancozeb. Remove infected leaves.",
      "Practice crop rotation. Avoid wetting foliage."
    ), !.

  diagnose_potato(_, _, _, _, _, _) :-
    show_unknown.

/* ============================================================
   TOMATO QUESTIONS
   ============================================================ */

  ask_tomato(C1, C2, C3, C4, C5, C6) :-
    nl,
    write("Answer each question with yes or no:"), nl, nl,
    ask_question("Do leaves show a mosaic of light and dark green?",       C1),
    ask_question("Are leaves curled, puckered, or distorted?",             C2),
    ask_question("Is the plant stunted or growing slowly?",                C3),
    ask_question("Are lower leaves yellowing and wilting during the day?", C4),
    ask_question("Does wilting recover at night but worsen each day?",     C5),
    ask_question("Is the stem brown inside when you cut it open?",         C6).

  diagnose_tomato("yes", "yes", "yes", _, _, _) :-
    show_result(
      "TOMATO MOSAIC VIRUS",
      "Caused by Tomato Mosaic Virus spread by insects.",
      "Remove infected plants. Control aphids with insecticide.",
      "Use virus-resistant seeds. Sanitize tools."
    ), !.

  diagnose_tomato(_, _, _, "yes", "yes", "yes") :-
    show_result(
      "FUSARIUM WILT",
      "Caused by soil fungus Fusarium oxysporum.",
      "Remove infected plants. Apply Thiophanate-methyl.",
      "Use Fusarium-resistant varieties. Rotate crops."
    ), !.

  diagnose_tomato(_, _, _, _, _, _) :-
    show_unknown.

/* ============================================================
   WHEAT QUESTIONS
   ============================================================ */

  ask_wheat(D1, D2, D3, D4, D5, D6) :-
    nl,
    write("Answer each question with yes or no:"), nl, nl,
    ask_question("Do you see yellow or orange stripe pustules on leaves?", D1),
    ask_question("Are the pustules arranged in rows along the leaf?",      D2),
    ask_question("Do leaves turn pale yellow between the pustule strips?", D3),
    ask_question("Do you see white powdery patches on leaves or stems?",   D4),
    ask_question("Are the powdery patches easily rubbed off?",             D5),
    ask_question("Are upper leaf surfaces primarily affected?",            D6).

  diagnose_wheat("yes", "yes", "yes", _, _, _) :-
    show_result(
      "YELLOW RUST (STRIPE RUST)",
      "Caused by fungus Puccinia striiformis.",
      "Apply Propiconazole or Tebuconazole at first sign.",
      "Plant rust-resistant varieties. Monitor in cool wet weather."
    ), !.

  diagnose_wheat(_, _, _, "yes", "yes", "yes") :-
    show_result(
      "POWDERY MILDEW",
      "Caused by fungus Blumeria graminis.",
      "Apply Triadimefon or Sulfur-based fungicide.",
      "Use resistant varieties. Avoid dense planting."
    ), !.

  diagnose_wheat(_, _, _, _, _, _) :-
    show_unknown.

/* ============================================================
   SHOW RESULT
   ============================================================ */

  show_result(Disease, Cause, Treatment, Prevention) :-
    nl,
    show_line,
    write("DIAGNOSIS RESULT"), nl,
    show_line, nl,
    write("DISEASE   : "), write(Disease),    nl, nl,
    write("CAUSE     : "), write(Cause),      nl, nl,
    write("TREATMENT : "), write(Treatment),  nl, nl,
    write("PREVENTION: "), write(Prevention), nl, nl,
    show_line,
    ask_again.

  show_unknown :-
    nl,
    show_line,
    write("DIAGNOSIS RESULT"), nl,
    show_line,
    write("Disease could not be identified."), nl,
    write("Please consult a local agricultural expert."), nl,
    show_line,
    ask_again.

/* ============================================================
   ASK AGAIN
   ============================================================ */

  ask_again :-
    nl,
    write("Diagnose another crop? (yes/no): "),
    readln(Again), nl,
    check_again(Again).

  check_again("yes") :-
    main_menu.

  check_again(_) :-
    write("Thank you for using the system. Goodbye!"), nl.

/* ============================================================
   GOAL
   ============================================================ */

goal
  start.
