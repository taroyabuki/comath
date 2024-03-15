import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import statsmodels.api as sm
import statsmodels.formula.api as smf
import sympy as sym
from collections import Counter
from patsy import dmatrices
from scipy import linalg, stats
from scipy.integrate import quad
from scipy.optimize import minimize
from sklearn.linear_model import LinearRegression
from statsmodels.stats.proportion import binom_test
from statsmodels.stats.weightstats import CompareMeans, DescrStatsW, ttest_ind
from sympy import *
from sympy.stats import *
from sympy.plotting import plot3d
