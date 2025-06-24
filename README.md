# automated_fit_and_simulate_SMA
Automated fitting and simulation of the SMA model using unseen data 

This MATLAB project automates the process of fitting and simulating unseen 
data using the Social Media Addiction (SMA) Adaptive Temporal-Causal Network Model. 

The code is partly **adapted** from:
- [NOME Tuning Adaptive Template](https://www.researchgate.net/publication/337830707_NOME_Tuning_Adaptive_Template)
- [NOME Adaptive Template v0.5](https://www.researchgate.net/publication/337049531_NOME_Adaptive_Template_v05)

It provides functionality to automatically process empirical data of n persons, 
and simulate the SMA model using these personalized characteristics.

## 📂 Project Structure

- `fit_and_simulate_livescript.mlx` – Entry point for fitting and simulating, the steps for running are outlined in the file
- `fit_and_simulate.m` – Helper functions for parameter fitting and simulating
- `Library/` – Library containing combination functions for the SMA Model

## ▶️ Getting Started
1. Add the Library folder to the Path (Home > Set Path)
2. Follow the steps in 'fit_and_simulate_livescript.mlx`

### Prerequisites

- MATLAB R2024b
- Optimization Toolbox
- Global Optimization Toolbox
- Statistics and Machine Learning Toolbox
