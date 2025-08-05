from modules import intuition, visualisation, référencement, structure, emission, reajustement

def run_cycle(input_text):
    idea = intuition.process(input_text)
    view = visualisation.project(idea)
    indexed = référencement.index(view)
    model_logic = structure.organize(indexed)
    output = emission.generate(model_logic)
    feedback = reajustement.learn(input_text, output)
    return output, feedback

if __name__ == "__main__":
    while True:
        user_input = input("🧠 Entrez une requête IA > ")
        if user_input.lower() in ["exit", "quit"]: break
        result, feedback = run_cycle(user_input)
        print("\n📤 Réponse IA :", result)
        print("🔁 Apprentissage intégré :", feedback)
