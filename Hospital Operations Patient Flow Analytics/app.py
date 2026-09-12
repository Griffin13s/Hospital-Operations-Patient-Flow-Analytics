import streamlit as st
import pandas as pd

st.set_page_config(
    page_title="Hospital Patient Flow Analytics",
    page_icon="🏥",
    layout="wide"
)

st.title("Hospital Operations & Patient Flow Analytics")
st.caption("Academic project using simulated emergency-department data")

df = pd.read_csv("hospital_er_cleaned.csv")

st.sidebar.header("Filters")

selected_region = st.sidebar.multiselect(
    "Select region",
    sorted(df["Region"].dropna().unique()),
    default=sorted(df["Region"].dropna().unique())
)

selected_urgency = st.sidebar.multiselect(
    "Select urgency level",
    sorted(df["Urgency Level"].dropna().unique()),
    default=sorted(df["Urgency Level"].dropna().unique())
)

filtered_df = df[
    df["Region"].isin(selected_region)
    & df["Urgency Level"].isin(selected_urgency)
]

col1, col2, col3, col4 = st.columns(4)

col1.metric("Total Visits", len(filtered_df))
col2.metric(
    "Average Total Wait",
    f"{filtered_df['Total Wait Time (min)'].mean():.2f} min"
)
col3.metric(
    "Average Satisfaction",
    f"{filtered_df['Patient Satisfaction'].mean():.2f}"
)
col4.metric(
    "Average Medical Professional Wait",
    f"{filtered_df['Time to Medical Professional (min)'].mean():.2f} min"
)

st.subheader("Average Wait Time by Hospital")

hospital_wait = (
    filtered_df.groupby("Hospital Name")["Total Wait Time (min)"]
    .mean()
    .sort_values(ascending=False)
)

st.bar_chart(hospital_wait)

st.subheader("Filtered Data")
st.dataframe(filtered_df, use_container_width=True)
