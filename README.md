![Preview](https://github.com/jesselynmu/aplikasi_pred_retensi/blob/main/Employee_BG.png)
# Employee Retention Prediction with Explainable AI

This project aims to address the growing issue of employee turnover in Indonesia by developing a web-based application that predicts employee retention. Companies rely heavily on their workforce, but increasing resignation rates — especially among the productive age group — present a serious challenge. Both internal and external factors influence an employee’s decision to stay or leave.

The application is built using **Streamlit** and utilizes the **CatBoost algorithm** for two purposes:
- **Classification**: to predict whether an employee will be retained or not
- **Regression**: to estimate the length of employment

To make the predictions interpretable, **SHAP (SHapley Additive exPlanations)** is used to identify the most influential factors behind the model’s decisions.

## 🛠 Tools & Deployment

- Python
- CatBoost
- SHAP (Explainable AI)
- Pandas, NumPy, Scikit-learn
- Streamlit (for web app interface)

## ✅ Results

- **Classification Accuracy**: 0.93  
- **F1-Score**: 0.96  
- **Regression R² Score**: 0.99  
- **MAPE**: 0.01  
- **BlackBox Testing Validation**: 100% passed

These results indicate excellent predictive performance and reliable interpretability, helping companies better understand employee behavior and improve retention strategies.

## 📌 How to Run

1. Clone this repository:  
   `git clone https://github.com/jesselynmu/aplikasi_pred_retensi.git`

2. Install the required libraries:  
   `pip install -r requirements.txt`

3. Run the Streamlit app:  
   `streamlit run app.py`

The app will open in your browser and allow you to input employee data to receive predictions and interpret the results via SHAP visualizations.

---

> **Note:** This project was developed as part of my undergraduate final thesis (*Tugas Akhir*).
