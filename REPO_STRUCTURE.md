# Repository Structure

A complete guide to what's in this repository and why each file is there.

## 📁 Directory Layout

```
Qiskit-env/
├── .devcontainer/              # GitHub Codespaces configuration
│   └── devcontainer.json       # Dev container setup (auto-installs dependencies)
│
├── .github/
│   └── workflows/
│       └── test.yml            # CI/CD pipeline (tests on push)
│
├── notebooks/                  # Jupyter notebooks (where you learn!)
│   └── 01_getting_started.ipynb # First notebook - Bell state example
│
├── .gitignore                  # Files to ignore in git (cache, venv, etc)
├── Makefile                    # Quick commands (make jupyter, make test, etc)
├── pyproject.toml              # Python project metadata
├── requirements.txt            # Python dependencies (pip install -r)
├── README.md                   # Main overview (start here!)
├── QUICKSTART.md               # 2-minute setup for Codespaces
├── SETUP.md                    # Detailed setup for all platforms
└── REPO_STRUCTURE.md           # This file

```

## 📄 Key Files Explained

### `.devcontainer/devcontainer.json`
**Purpose:** Configures GitHub Codespaces environment
- Specifies Python 3.11 image
- Installs all dependencies automatically
- Sets up Jupyter Lab with extensions
- Creates the "Python (Practitioner)" kernel

**Why it matters:** When you create a Codespace, this file ensures everything is installed without manual steps.

### `requirements.txt`
**Purpose:** Lists all Python packages to install
- Qiskit and ecosystem packages (IBM Runtime, Optimization, ML, etc.)
- Jupyter and notebook tools
- Data science libraries (NumPy, Pandas, Matplotlib, etc.)
- Testing and code quality tools

**Why it matters:** `pip install -r requirements.txt` gets you everything you need.

### `.github/workflows/test.yml`
**Purpose:** Automated testing on GitHub
- Tests on Python 3.9, 3.10, 3.11
- Verifies all packages can be imported
- Runs code linting

**Why it matters:** Ensures the environment setup works before changes are merged.

### `notebooks/` Directory
**Purpose:** Your learning materials go here
- `01_getting_started.ipynb` - First example (Bell state circuit)
- Additional notebooks can be added for different topics

**Why it matters:** This is where you write and run your quantum code.

### `Makefile`
**Purpose:** Shortcuts for common commands
```bash
make install          # Install dependencies
make jupyter          # Start Jupyter Lab
make test            # Run tests
make clean           # Remove cache files
```

**Why it matters:** Faster than typing long commands.

### `README.md`
**Purpose:** Main documentation
- Overview of the program
- Quick start instructions
- Environment structure
- Links to resources

**Why it matters:** First place to look for help.

### `QUICKSTART.md`
**Purpose:** Fast setup guide for Codespaces
- 4 simple steps to run your first notebook
- Common issues and fixes
- 2-minute read

**Why it matters:** Get running fastest if using Codespaces.

### `SETUP.md`
**Purpose:** Detailed setup for all platforms
- Codespaces with troubleshooting
- macOS/Linux local setup
- Windows local setup
- IBM Quantum access setup
- Verification script

**Why it matters:** Comprehensive reference if something breaks.

### `pyproject.toml`
**Purpose:** Python project metadata
- Package name and version
- Python version requirements
- Code formatting rules (Black, isort)
- Testing configuration (pytest)

**Why it matters:** Standardizes how the project is configured.

### `.gitignore`
**Purpose:** Tells git what files to ignore
- Python cache (`__pycache__`, `*.pyc`)
- Virtual environment (`venv/`)
- Jupyter checkpoints
- IDE files (`.vscode/`, `.idea/`)
- Environment variables (`.env`)

**Why it matters:** Keeps the repository clean and prevents accidentally committing secrets.

## 🚀 Workflow

### For First-Time Users (Codespaces)

1. Click **Code** → **Codespaces** → **Create codespace on main**
2. `.devcontainer/devcontainer.json` automatically installs everything
3. Open terminal and run: `jupyter lab`
4. Open `notebooks/01_getting_started.ipynb`
5. Run cells with Shift+Enter
6. Modify and experiment!

### For Local Setup

1. Clone the repo
2. Create virtual environment: `python -m venv venv`
3. Activate it: `source venv/bin/activate`
4. Install: `pip install -r requirements.txt`
5. Run: `jupyter lab`

### For Development/Contributing

1. Install dev tools: `make install-dev`
2. Create a new branch for your work
3. Make changes to notebooks or code
4. Test: `make test` and `make lint`
5. Format code: `make format`
6. Commit and push
7. GitHub Actions tests run automatically

## 📦 What Gets Installed?

### Quantum Computing
- **Qiskit**: IBM's quantum framework + extensions
- **Cirq**: Google's quantum framework
- **PennyLane**: Xanadu's quantum ML framework

### Data Science
- **NumPy, Pandas**: Data manipulation
- **Matplotlib, Seaborn, Plotly**: Visualization
- **Scikit-learn**: Classical ML
- **SciPy**: Scientific computing

### Jupyter
- **JupyterLab**: Interactive notebook environment
- **IPython**: Enhanced Python shell
- **Jupyter extensions**: For better experience

### Dev Tools
- **Black**: Code formatter
- **Flake8**: Code linter
- **Pytest**: Testing framework

## 🔧 Customization

### Adding Dependencies

1. Edit `requirements.txt`
2. Add new line with package name
3. Run: `pip install -r requirements.txt`
4. Commit and push
5. New Codespaces will have the dependency

### Adding Notebooks

1. Create `.ipynb` file in `notebooks/`
2. Number them: `02_...`, `03_...` for progression
3. Add a markdown header with title
4. Commit and push

### Modifying Dev Container

Edit `.devcontainer/devcontainer.json` to:
- Add VS Code extensions
- Install system packages
- Change Python version
- Add environment variables

## 📚 Learning Path Suggested

```
01_getting_started.ipynb
├── Bell states (entanglement)
├── Measurement basics
└── Visualization

02_quantum_gates.ipynb (to create)
├── Single qubit gates
├── Multi-qubit gates
└── Circuit optimization

03_quantum_algorithms.ipynb (to create)
├── Deutsch-Jozsa
├── Grover's algorithm
└── VQE basics

04_ibm_quantum.ipynb (to create)
├── Running on real hardware
├── Job management
└── Results analysis
```

## 🆘 Troubleshooting Quick Links

- **Codespaces issues** → See `SETUP.md` → "Option 1: GitHub Codespaces"
- **Local setup issues** → See `SETUP.md` → "Option 2/3: Local Development"
- **Jupyter issues** → See `QUICKSTART.md` → "Common Issues"
- **Python/Pip issues** → Check virtual environment is activated

## 📖 External Resources

- [Qiskit Docs](https://docs.quantum.ibm.com/)
- [Jupyter Lab Guide](https://jupyter.org/)
- [GitHub Codespaces](https://github.com/features/codespaces)
- [Python venv Guide](https://docs.python.org/3/tutorial/venv.html)

---

**You now understand the entire repository structure!** 🎓

Time to start learning quantum computing! 🚀
