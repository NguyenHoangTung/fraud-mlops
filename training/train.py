import pandas as pd, joblib
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report, roc_auc_score
from xgboost import XGBClassifier

df = pd.read_csv("data/creditcard.csv")

X = df[[c for c in df.columns if c.startswith("V")] + ["Amount"]]
y = df["Class"]