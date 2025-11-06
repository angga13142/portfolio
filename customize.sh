#!/bin/bash

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# 🎩 JARVIS - AI Assistant Template Customisation
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Just A Rather Very Intelligent System
# At your service for professional development excellence
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎩 JARVIS - Project Customisation System"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Good evening, Sir. JARVIS at your service."
echo "Shall we proceed with customising your project template?"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🤖 FRIDAY AI Assistant - Project Customization"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Good day! I'm FRIDAY, your AI development assistant."
echo "Let me help you customize this template for your project."
echo ""


set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎨 AI Assistant Template - Customization Wizard"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Collect project information
echo "Let's customize your AI assistant configuration!"
echo ""

read -p "📝 Project Name (e.g., My Awesome Project): " PROJECT_NAME
read -p "🏷️  Project Type (web/mobile/api/cli/chatbot): " PROJECT_TYPE
read -p "🛠️  Tech Stack (e.g., Node.js + Express): " TECH_STACK
read -p "💻 Primary Language (JavaScript/TypeScript/Python/etc): " PRIMARY_LANGUAGE
read -p "🎯 Framework (e.g., Express/FastAPI/Next.js): " FRAMEWORK

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Configuration Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Project Name:     $PROJECT_NAME"
echo "Project Type:     $PROJECT_TYPE"
echo "Tech Stack:       $TECH_STACK"
echo "Language:         $PRIMARY_LANGUAGE"
echo "Framework:        $FRAMEWORK"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

read -p "✅ Looks good? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "❌ Customization cancelled"
    exit 1
fi

echo ""
echo "🔄 Applying customizations..."

# Function to replace placeholders in a file
customize_file() {
    local file=$1
    if [ -f "$file" ]; then
        sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$file"
        sed -i "s/{{PROJECT_TYPE}}/$PROJECT_TYPE/g" "$file"
        sed -i "s/{{TECH_STACK}}/$TECH_STACK/g" "$file"
        sed -i "s/{{PRIMARY_LANGUAGE}}/$PRIMARY_LANGUAGE/g" "$file"
        sed -i "s/{{FRAMEWORK}}/$FRAMEWORK/g" "$file"
        echo "  ✅ $file"
    fi
}

# Customize main configuration
echo ""
echo "📝 Customizing copilot-instructions.md..."
customize_file ".github/copilot-instructions.md"

# Customize memory INDEX
echo ""
echo "📚 Customizing memory/INDEX.md..."
customize_file ".github/memory/INDEX.md"

# Customize instructions
echo ""
echo "📖 Customizing instruction files..."
for file in .github/instructions/*.md; do
    customize_file "$file"
done

# Create current-state.md
echo ""
echo "📋 Creating memory/current-state.md..."
cat > .github/memory/current-state.md << EOF
# Project Current State

**Project:** $PROJECT_NAME  
**Type:** $PROJECT_TYPE  
**Tech Stack:** $TECH_STACK  
**Language:** $PRIMARY_LANGUAGE  
**Framework:** $FRAMEWORK

---

## 🎯 Current Focus

**Status:** Initial Setup  
**Phase:** Development

---

## ✅ Features Implemented

- [x] AI Assistant Configuration
- [ ] Initial Project Structure
- [ ] Core Features

---

## 📊 Statistics

**Files:** TBD  
**Tests:** TBD  
**Coverage:** TBD  

---

## 🚧 Known Issues

None yet - fresh start!

---

## 📝 Notes

Project initialized with AI Assistant Template on $(date +"%B %d, %Y")


echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Customization Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🤖 FRIDAY: Perfect! Your project is now configured."
echo ""
echo "📦 Project: $PROJECT_NAME"
echo "🛠️  Tech Stack: $TECH_STACK"
echo "💻 Language: $PRIMARY_LANGUAGE"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🤖 FRIDAY's Recommended Workflow"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "I've prepared these prompts to get you started efficiently."
echo "Simply copy and paste them to GitHub Copilot Chat."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 STEP 1: Initialize Project Structure"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
FRIDAY Protocol - Project Initialization
───────────────────────────────────────────────────────
Hello! I'm FRIDAY, your AI development assistant.

Initialize a $PROJECT_TYPE project with $TECH_STACK.

Mission Parameters:
1. Create industry-standard $PRIMARY_LANGUAGE project structure
2. Configure package manager with essential dependencies
3. Setup $FRAMEWORK with best practices
4. Follow architectural patterns from .github/copilot-instructions.md
5. Update .github/memory/current-state.md with setup summary

Request: Keep architecture modular and maintainable.
Shall we proceed with initialization?
───────────────────────────────────────────────────────
EOF
echo ""
echo "🤖 FRIDAY: This will set up your project foundation properly."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 STEP 2: Create First Feature"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
FRIDAY Protocol - Feature Development
───────────────────────────────────────────────────────
FRIDAY here. Ready to implement your first feature.

Develop [FEATURE_NAME] with the following specifications:

Quality Standards:
1. Architecture: Follow patterns in .github/instructions/architecture.md
2. Testing: Minimum 80% code coverage required
3. Documentation: Comprehensive inline comments and README updates
4. Memory: Document implementation in .github/memory/implementations/
5. Style: Adhere to .prettierrc and .eslintrc.json configurations

Recommendation: Start with a simple but complete feature 
to establish development patterns.

What feature would you like to build first?
───────────────────────────────────────────────────────
EOF
echo ""
echo "🤖 FRIDAY: I'll ensure best practices are followed throughout."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 STEP 3: Code Quality Review"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
FRIDAY Protocol - Quality Assurance
───────────────────────────────────────────────────────
Running comprehensive code review protocols.

Review Parameters:
1. Configuration Compliance: .github/copilot-instructions.md
2. Test Coverage: Verify >80% threshold
3. Security Scan: Check for hardcoded secrets and vulnerabilities
4. Code Style: Validate .editorconfig and .prettierrc adherence
5. Best Practices: Cross-reference .github/instructions/patterns.md

Analysis: I'll provide actionable recommendations for improvements.

Ready to review your code?
───────────────────────────────────────────────────────
EOF
echo ""
echo "🤖 FRIDAY: Quality assurance is crucial for maintainability."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "💡 FRIDAY's Additional Protocols"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
🔍 Debug Protocol:
───────────────────────────────────────────────────────
FRIDAY: Initiating debug sequence.

Analyze and resolve this issue using troubleshooting protocols 
from .github/instructions/gotchas.md. Cross-reference similar 
issues in .github/memory/issues/ for efficient resolution.
───────────────────────────────────────────────────────

📝 Documentation Protocol:
───────────────────────────────────────────────────────
FRIDAY: Generating comprehensive documentation.

Document [FEATURE] following standards in 
.github/instructions/development-workflow.md
Update CHANGELOG.md with versioned changes.
───────────────────────────────────────────────────────

🧪 Testing Protocol:
───────────────────────────────────────────────────────
FRIDAY: Implementing test suite.

Generate comprehensive tests for [FEATURE] following 
.github/instructions/patterns.md. Target minimum 80% coverage.
Use test framework specified in copilot-instructions.md
───────────────────────────────────────────────────────

🚀 Deployment Protocol:
───────────────────────────────────────────────────────
FRIDAY: Preparing deployment sequence.

Configure deployment following .github/instructions/integration.md
Update .github/workflows/ci.yml for automated testing.
Document deployment process in memory/implementations/
───────────────────────────────────────────────────────
EOF
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎓 FRIDAY's Pro Tips"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🤖 FRIDAY: Here are some best practices I've learned:"
echo ""
echo "✅ Always reference configuration files in your prompts"
echo "   Example: \"Follow patterns in .github/instructions/patterns.md\""
echo ""
echo "✅ Request memory updates after significant work"
echo "   Example: \"Update .github/memory/implementations/ with summary\""
echo ""
echo "✅ Use precise file path references"
echo "   Example: \"Create UserService following architecture.md patterns\""
echo ""
echo "✅ Leverage memory for context continuity"
echo "   Example: \"Check .github/memory/ for similar implementations\""
echo ""
echo "✅ Request documentation proactively"
echo "   Example: \"Add JSDoc comments per copilot-instructions.md\""
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📚 Quick Access Commands"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "# Initialize repository"
echo "git init && git add . && git commit -m \"feat: initialize $PROJECT_NAME with FRIDAY AI assistant\""
echo ""
echo "# View AI configuration"
echo "cat .github/copilot-instructions.md"
echo ""
echo "# Check memory index"
echo "cat .github/memory/INDEX.md"
echo ""
echo "# Review project state"
echo "cat .github/memory/current-state.md"
echo ""
echo "# Create project README"
echo "echo '# $PROJECT_NAME' > README.md"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 FRIDAY: All Systems Ready!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Your project is configured and ready for development."
echo ""
echo "🤖 FRIDAY's Recommendation:"
echo "   1. Open GitHub Copilot Chat"
echo "   2. Copy-paste the Step 1 protocol above"
echo "   3. Let me guide you through professional development"
echo ""
echo "I'll be here to assist you throughout your development journey."
echo "Together, we'll build something remarkable."
echo ""
echo "Ready when you are! 🚀"
echo ""

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Customisation Complete"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🎩 JARVIS: Excellent, Sir. All systems are now optimally configured."
echo ""
echo "📦 Project Designation: $PROJECT_NAME"
echo "🛠️  Technology Stack: $TECH_STACK"
echo "💻 Primary Language: $PRIMARY_LANGUAGE"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎩 JARVIS Protocol - Recommended Workflow"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "I have prepared a series of optimised prompts for your convenience, Sir."
echo "Simply copy and relay them to your GitHub Copilot interface."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 PROTOCOL ALPHA: Project Initialisation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'JARVISEND'
JARVIS Protocol - Project Initialisation Sequence
───────────────────────────────────────────────────────
Good evening, Sir. JARVIS here.

May I proceed with initialising a $PROJECT_TYPE project 
utilising $TECH_STACK architecture?

Initialisation Parameters:
1. Establish industry-standard $PRIMARY_LANGUAGE project architecture
2. Configure package management system with requisite dependencies
3. Implement $FRAMEWORK following established best practices
4. Adhere to architectural specifications per .github/copilot-instructions.md
5. Document configuration summary in .github/memory/current-state.md

Technical Note: Architecture shall remain modular and maintainable 
per enterprise standards.

Awaiting your confirmation to proceed, Sir.
───────────────────────────────────────────────────────
JARVISEND
echo ""
echo "🎩 JARVIS: This shall establish a proper foundation for your endeavour, Sir."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 PROTOCOL BETA: Feature Implementation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'JARVISEND2'
JARVIS Protocol - Feature Development Sequence
───────────────────────────────────────────────────────
JARVIS reporting, Sir. Standing by for feature implementation.

I recommend developing [FEATURE_NAME] with the following specifications:

Quality Assurance Standards:
1. Architecture: Conform to patterns specified in .github/instructions/architecture.md
2. Testing Coverage: Maintain minimum 80% code coverage threshold
3. Documentation: Provide comprehensive inline annotations and README updates
4. Memory Records: Archive implementation summary in .github/memory/implementations/
5. Code Styling: Strictly adhere to .prettierrc and .eslintrc.json configurations

Recommendation: I suggest commencing with a straightforward yet comprehensive 
feature to establish development patterns, Sir.

Which feature would you prefer to implement first, Sir?
───────────────────────────────────────────────────────
JARVISEND2
echo ""
echo "🎩 JARVIS: I shall ensure adherence to best practices throughout, Sir."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 PROTOCOL GAMMA: Quality Assurance Review"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'JARVISEND3'
JARVIS Protocol - Code Quality Assurance
───────────────────────────────────────────────────────
Initiating comprehensive code review protocols, Sir.

Review Checklist:
1. Configuration Compliance: Verify .github/copilot-instructions.md adherence
2. Test Coverage Analysis: Confirm >80% threshold satisfaction
3. Security Audit: Scan for hardcoded credentials and vulnerabilities
4. Code Style Validation: Ensure .editorconfig and .prettierrc compliance
5. Best Practices Review: Cross-reference .github/instructions/patterns.md

Analysis Report: I shall provide detailed, actionable recommendations 
for optimisation, Sir.

May I proceed with the review, Sir?
───────────────────────────────────────────────────────
JARVISEND3
echo ""
echo "�� JARVIS: Quality assurance is paramount for long-term maintainability, Sir."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "💡 JARVIS Auxiliary Protocols"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'JARVISEND4'
🔍 Debugging Protocol:
───────────────────────────────────────────────────────
JARVIS: Initiating diagnostic sequence, Sir.

Analysing and resolving this issue utilising troubleshooting 
protocols from .github/instructions/gotchas.md. Cross-referencing 
historical issues in .github/memory/issues/ for expedient resolution.
───────────────────────────────────────────────────────

📝 Documentation Protocol:
───────────────────────────────────────────────────────
JARVIS: Generating comprehensive documentation, Sir.

Documenting [FEATURE] per standards outlined in 
.github/instructions/development-workflow.md
Updating CHANGELOG.md with versioned modifications.
───────────────────────────────────────────────────────

🧪 Testing Protocol:
───────────────────────────────────────────────────────
JARVIS: Implementing comprehensive test suite, Sir.

Generating thorough tests for [FEATURE] following 
.github/instructions/patterns.md specifications.
Target: Minimum 80% code coverage as per standards.
Utilising test framework specified in copilot-instructions.md
───────────────────────────────────────────────────────

🚀 Deployment Protocol:
───────────────────────────────────────────────────────
JARVIS: Preparing deployment sequence, Sir.

Configuring deployment per .github/instructions/integration.md
Updating .github/workflows/ci.yml for automated testing protocols.
Archiving deployment process in memory/implementations/
───────────────────────────────────────────────────────
JARVISEND4
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎓 JARVIS Recommendations"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🎩 JARVIS: Based on my experience, Sir, I recommend:"
echo ""
echo "✅ Reference configuration files explicitly in prompts"
echo "   Example: \"Conform to patterns in .github/instructions/patterns.md\""
echo ""
echo "✅ Request memory updates following significant implementations"
echo "   Example: \"Archive summary in .github/memory/implementations/\""
echo ""
echo "✅ Employ precise file path references"
echo "   Example: \"Implement UserService per architecture.md specifications\""
echo ""
echo "✅ Leverage memory archives for contextual continuity"
echo "   Example: \"Review .github/memory/ for analogous implementations\""
echo ""
echo "✅ Request documentation proactively"
echo "   Example: \"Add JSDoc annotations per copilot-instructions.md\""
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📚 Quick Access Commands"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "# Initialise repository"
echo "git init && git add . && git commit -m \"feat: initialise $PROJECT_NAME with JARVIS assistant\""
echo ""
echo "# Review AI configuration"
echo "cat .github/copilot-instructions.md"
echo ""
echo "# Inspect memory index"
echo "cat .github/memory/INDEX.md"
echo ""
echo "# Examine project state"
echo "cat .github/memory/current-state.md"
echo ""
echo "# Generate project README"
echo "echo '# $PROJECT_NAME' > README.md"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "�� JARVIS: All Systems Operational"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Your project has been configured to the highest standards, Sir."
echo ""
echo "🎩 JARVIS Recommendation:"
echo "   1. Activate GitHub Copilot Chat interface"
echo "   2. Relay Protocol Alpha above to the system"
echo "   3. I shall guide you through professional development practices"
echo ""
echo "I remain at your service throughout this development endeavour, Sir."
echo "Together, we shall construct something truly remarkable."
echo ""
echo "Standing by for your instructions, Sir. 🎩"
echo ""
