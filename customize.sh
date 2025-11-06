#!/bin/bash

# AI Assistant Template - Customization Script
# This script helps you quickly customize the template for your project

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

---

**Last Updated:** $(date +"%B %d, %Y")
EOF

echo "  ✅ current-state.md created"

# Remove template README
echo ""
echo "🧹 Cleaning up template README..."
rm -f README.md
echo "  ✅ Template README removed"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Customization Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📦 Your Project: $PROJECT_NAME"
echo "🛠️  Tech Stack: $TECH_STACK"
echo "💻 Language: $PRIMARY_LANGUAGE"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚀 QUICK START - Copy & Paste These Prompts to AI"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 STEP 1: Initialize Project Structure"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
Copy this prompt to GitHub Copilot Chat:
───────────────────────────────────────────────────────
Initialize a $PROJECT_TYPE project with $TECH_STACK.

Requirements:
1. Create standard $PRIMARY_LANGUAGE project structure
2. Setup package manager configuration
3. Add basic dependencies for $FRAMEWORK
4. Follow best practices from .github/copilot-instructions.md
5. Update .github/memory/current-state.md with initial setup

Keep it simple and modular. Ready to start?
───────────────────────────────────────────────────────
EOF
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 STEP 2: Create First Feature"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
Copy this prompt to GitHub Copilot Chat:
───────────────────────────────────────────────────────
Create a simple [FEATURE_NAME] feature for this project.

Requirements:
1. Follow architecture patterns in .github/instructions/architecture.md
2. Write tests with >80% coverage
3. Add comprehensive documentation
4. Update .github/memory/implementations/ with summary
5. Follow code style from .prettierrc and .eslintrc.json

What feature should we build first?
───────────────────────────────────────────────────────
EOF
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 STEP 3: Code Review"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
Copy this prompt to GitHub Copilot Chat:
───────────────────────────────────────────────────────
Review my code following these guidelines:

1. Check .github/copilot-instructions.md compliance
2. Verify test coverage >80%
3. Ensure no hardcoded secrets
4. Check code follows .editorconfig & .prettierrc
5. Suggest improvements from .github/instructions/patterns.md

Show me what needs fixing.
───────────────────────────────────────────────────────
EOF
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "💡 BONUS PROMPTS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
cat << 'EOF'
🔍 Debugging:
───────────────────────────────────────────────────────
Debug this issue following troubleshooting guide in 
.github/instructions/gotchas.md. Check memory for 
similar issues in .github/memory/issues/
───────────────────────────────────────────────────────

📝 Documentation:
───────────────────────────────────────────────────────
Generate comprehensive documentation for [FEATURE].
Follow format in .github/instructions/development-workflow.md
and update CHANGELOG.md with changes.
───────────────────────────────────────────────────────

🧪 Testing:
───────────────────────────────────────────────────────
Write comprehensive tests for [FEATURE] following 
.github/instructions/patterns.md. Target >80% coverage.
Use test framework specified in copilot-instructions.md
───────────────────────────────────────────────────────

🚀 Deployment:
───────────────────────────────────────────────────────
Setup deployment following .github/instructions/integration.md
Update .github/workflows/ci.yml if needed.
Document process in memory/implementations/
───────────────────────────────────────────────────────
EOF
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎓 PRO TIPS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✅ Always reference config files in prompts:"
echo "   \"Follow patterns in .github/instructions/patterns.md\""
echo ""
echo "✅ Ask AI to update memory after major work:"
echo "   \"Update .github/memory/implementations/ with what we just built\""
echo ""
echo "✅ Use specific file references:"
echo "   \"Create UserService following architecture.md patterns\""
echo ""
echo "✅ Request documentation:"
echo "   \"Add JSDoc comments following copilot-instructions.md\""
echo ""
echo "✅ Leverage memory for context:"
echo "   \"Check .github/memory/ for similar implementations\""
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📚 HELPFUL COMMANDS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "# Create README"
echo "echo '# $PROJECT_NAME' > README.md"
echo ""
echo "# Initialize git (if not done)"
echo "git init"
echo "git add ."
echo "git commit -m \"feat: initial project setup from AI assistant template\""
echo ""
echo "# View AI configuration"
echo "cat .github/copilot-instructions.md"
echo ""
echo "# Check memory index"
echo "cat .github/memory/INDEX.md"
echo ""
echo "# View current project state"
echo "cat .github/memory/current-state.md"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 READY TO CODE!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Open GitHub Copilot Chat and paste the Step 1 prompt above."
echo "The AI will guide you through the entire setup! 🚀"
echo ""
echo "Happy coding with your AI-powered workflow! 💻✨"
echo ""
