# Quick Start Guide - GitHub Codespaces

Get up and running in 2 minutes!

## 1. Create Your Codespace

1. Click **Code** on the repository
2. Select **Codespaces** tab
3. Click **Create codespace on main**
4. Wait for the browser to load (this initializes everything automatically)

## 2. Start Jupyter Lab

Once the codespace is ready, open the terminal and run:

```bash
jupyter lab
```

The terminal will show a URL like:
```
http://localhost:8888/lab?token=abc123...
```

Codespaces will automatically forward the port and open Jupyter Lab in a new browser tab.

## 3. Run Your First Notebook

1. In Jupyter, click on the **Files** folder on the left
2. Navigate to `notebooks/`
3. Open `01_getting_started.ipynb`
4. Make sure kernel is set to **"Python (Practitioner)"** (top right)
5. Click **Run All Cells** or run cell-by-cell with **Shift+Enter**

## 4. See Your Results

The notebook will:
- Create a quantum circuit (Bell state)
- Execute it
- Show measurement results
- Visualize the results in a histogram

### Expected Output

You should see:
- A quantum circuit diagram with 2 qubits
- Measurement results showing mostly `00` and `11` states
- A histogram showing the probability distribution

## Tips

**Running Cells:**
- `Shift+Enter` - Run current cell and move to next
- `Ctrl+Enter` - Run current cell
- **Kernel** menu → **Restart Kernel** - Start fresh if something breaks

**Creating New Notebooks:**
- **File** → **New Notebook**
- Choose kernel "Python (Practitioner)"
- Start coding!

**Stopping Jupyter:**
- Press `Ctrl+C` in the terminal

**Restarting Later:**
- Your codespace is saved! Click **Code** → **Codespaces** to resume

## Next Steps

1. **Read SETUP.md** for detailed installation info
2. **Read README.md** for program overview
3. **Explore notebooks/** for lessons
4. **Modify examples** to learn

## Common Issues

**"Module not found" errors:**
```bash
pip install -r requirements.txt
```

**Jupyter won't start:**
```bash
python -m ipykernel install --user --name practitioner --display-name 'Python (Practitioner)'
jupyter lab
```

**Codespace slow:**
- This is normal for first launch (up to 10 minutes)
- Resuming later is much faster

## Resources

- [Qiskit Getting Started](https://docs.quantum.ibm.com/start)
- [Jupyter Lab Documentation](https://jupyter.org/try)
- [GitHub Codespaces Help](https://docs.github.com/en/codespaces)

---

You're all set! Start learning quantum computing! 🚀
