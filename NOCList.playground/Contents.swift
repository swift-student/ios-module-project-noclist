/*:
# Module Project - NOC List

Greetings agent. Your mission is a top priority for the agency. Please read below for further info.

Our undercover agents in Eastern Europe are in trouble. The NOC list (Non-official cover) has been leaked and we need our directors to have quick access to the information so we can try to mitigate the damage. Some of the agents on the list have an access level that makes them privy to very sensitive information. We need an application that will present the NOC list's information in a quickly digestible format. Our top agents have been working on it, but we need this done ASAP and you've proven yourself to be quite capable of a quick turnaround.

The Director herself has given you access to all the agency's resources to complete this mission. We're counting on you agent.

Here is the complete NOC List. This information is classified at the highest levels, so guard it very carefully.

 ---
 
 * coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false
 * coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true
 * coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false
 * coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true
 * coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false
 * coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false
 * coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true
 * coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false
 * coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true
 * coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true
 * coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false
 
 ---

This message will self destruct in 5 seconds.
*/
//: ## Step 1
//: Create constants for each of the above agents and store all their information in a tuple.
typealias Agent = (coverName: String, realName: String, accessLevel: Int, compromised: Bool)

let ethanHunt = (coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false)
let jimPhelps = (coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true)
let clairePhelps = (coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false)
let eugeneKittridge = (coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true)
let franzKrieger = (coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false)
let lutherStickell = (coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false)
let sarahDavies = (coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true)
let maxRotGrab = (coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false)
let hannahWilliams = (coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true)
let jackHarmon = (coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true)
let frankBarnes = (coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false)
//: ## Step 2
//: Place the above constants inside an array. Declare this array as a constant as well.
let agents = [ethanHunt, jimPhelps, clairePhelps, eugeneKittridge, franzKrieger, lutherStickell, sarahDavies, maxRotGrab, hannahWilliams, jackHarmon, frankBarnes]


//: ## Step 3
//: Create a function that calculates the total number of compromised agents. Inside the function, iterate over the array of agents to determine which ones are compromised. Return the total count.
func compromisedCount(_ agents: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]) -> Int {
    var count = 0
    for agent in agents {
        if agent.compromised {
            count += 1
        }
    }
    return count
}


//: ## Step 4
//: Call the above function to find the total number of compromised agents and then print a sentence that says "# agents have been compromised!" using string interpolation.
print("\(compromisedCount(agents)) agents have been compromised!")


//: ## Step 5
//: Create a function called "findCleanAgents" that both prints the cover names of all uncompromised agents, as well as returns an array of agents that are uncompromised.
func findCleanAgents(_ agents: [Agent]) -> [Agent] {
    var cleanAgents = [Agent]()
    for agent in agents {
        if !agent.compromised {
            print("\(agent.coverName)")
            cleanAgents.append(agent)
        }
    }
    return cleanAgents
}


//: ## Step 6
//: Call the above function to find the total number of clean agents and print a message that says "# clean agents out of # total agents." Use the total number of agents in the array from step 2 as the second number in the string.
let cleanAgents = findCleanAgents(agents)
print("\(cleanAgents.count) clean agents out of \(agents.count) total agents.")

//: ## Step 7
//: Create a function called "findHighRisk" that prints out the real names and access levels of agents with level 8 or higher. If one of these agents is also currently compromised, add `**WARNING** **COMPROMISED**` to the end of the string that includes their name and access level.
//: - Example: `Jon Voight, level: 9 **WARNING** **COMPROMISED**`
func findHighRisk(_ agents: [Agent]) {
    for agent in agents {
        if agent.accessLevel >= 8 {
            var description = "\(agent.realName) , level: \(agent.accessLevel)"
            if agent.compromised {
                description += " **WARNING** **COMPROMISED**"
            }
            print(description)
        }
    }
}


//: ## Step 8
//: Call the above function and check the output in the console to ensure it is functioning properly.
findHighRisk(agents)


//: ## Step 9
//: Create a function that finds totals for low, mid, and high level agents. Low level agents are 4 or lower, mid are 5-7, and high level agents are 8 or above. Iterate over each agent and use a `switch` statement to determine their level group. At the end of the function, print a statement like the following: "# low level agents, # mid level agents, and # high level agents"
func reportLevelTotals(_ agents: [Agent]) {
    var lowLevelCount = 0
    var midLevelCount = 0
    var highLevelCount = 0
    
    for agent in agents {
        switch agent.accessLevel {
        case 0...4:
            lowLevelCount += 1
        case 5...7:
            midLevelCount += 1
        default:
            highLevelCount += 1
        }
    }
    
    print("There are \(lowLevelCount) low level agents, \(midLevelCount) mid level agents, and \(highLevelCount) high level agents.")
}

//: ## Step 10
//: Call the above function and check its output in the console.
reportLevelTotals(agents)


//: ## Step 11 (Optional)
//: Create and call a function that prints the cover names and access levels of all agents, but the list should be sorted by access level, in ascending order.
// This is made super easy by swift's sorted function. It take a closure as an argument that compares two parameters and returns a bool. I'm simply using the automatic $0 and $1 shorthand parameter names and comparing them and using implicit return to simplify the closure. Then I just iterate over the array using forEach which performs a closure passed in on each of the agents, printing their cover name and access level. This is a very functional way of doing things and leads to being able to print the agents sorted by access level in one line of code.

print("\n--- Sorted Agents ---\n")
func printSortedCoverNames(_ agents: [Agent]) {
    agents.sorted { $0.accessLevel < $1.accessLevel }.forEach { print("\($0.coverName), level: \($0.accessLevel)") }
}

printSortedCoverNames(agents)

// A more verbose way of doing it, still using sorted and forEach:

//func printSortedCoverNames(_ agents: [Agent]) {
//    let sortedAgents = agents.sorted { (agent1: Agent, agent2: Agent) -> Bool in
//        agent1.accessLevel < agent2.accessLevel
//    }
//    sortedAgents.forEach { (agent: Agent) in
//        print("\(agent.coverName), level: \(agent.accessLevel)")
//    }
//}
//
//printSortedCoverNames(agents)

// Now let's pretend that swift didn't have a sorted function. That would mean that we would have to implement our own sort algorithm.
// This is my first time working with quick sort and I see there are a few ways of doing it, still working on wrapping my head around it
// My quick sort may not be so "quick", lol

extension Array {
    func quickSorted(by predicate: (Element, Element) -> Bool) -> [Element] {
        
        func quicksort(_ array: inout [Element], low: Int, high: Int) {
            // check for base case
            guard low < high else { return }
            
            // partition
            let p = partition(&array, low: low, high: high)
            
            quicksort(&array, low: low, high: p)
            quicksort(&array, low: p + 1, high: high)
        }

        func partition(_ array: inout[Element], low: Int, high: Int) -> Int {
            let pivot = array[low]
            var i = low - 1
            var j = high + 1

            while true {
                repeat { j -= 1 } while predicate(pivot, array[j])
                repeat { i += 1 } while predicate(array[i], pivot)

              if i < j {
                array.swapAt(i, j)
              } else {
                return j
              }
                
            }
        }
        
        var result = self
        quicksort(&result, low: 0, high: self.count - 1)
        return result
    }
}

func printQuickSortedCoverNames(_ agents: [Agent]) {
    agents.quickSorted(by: { $0.accessLevel < $1.accessLevel }).forEach { print("\($0.coverName), level: \($0.accessLevel)") }
}

print("\n--- Quicksorted Agents ---\n")
printQuickSortedCoverNames(agents)
