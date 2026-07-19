# Sports-Wellness-Analytics
**Developed an end-to-end analytics pipeline using survey-weighted statistics, machine learning, and Power BI to support athlete wellness monitoring and evidence-based performance decisions.**

# 🥍 Sports Wellness Analytics

## Executive Summary

This project demonstrates how survey statistics, predictive analytics, and business intelligence can be combined to support evidence-based athlete wellness monitoring.

Using daily wellness survey data collected throughout an NCAA Division I men's lacrosse season, I developed an end-to-end analytics pipeline that transforms subjective athlete wellness responses into actionable insights for coaches and sports medicine professionals.

The project integrates survey-weighted statistical methods, bootstrapping, regression modeling, machine learning, and interactive Power BI dashboards to identify the primary drivers of athlete wellness and support proactive decision-making.

---

## Business Problem

Athlete wellness is influenced by multiple physical and psychological factors that fluctuate throughout the competitive season.

Traditional monitoring often relies on isolated observations or raw survey responses, making it difficult to identify meaningful trends or determine when intervention is needed.

The objective of this project was to develop a repeatable analytics framework capable of:

- Monitoring athlete wellness
- Identifying key wellness drivers
- Understanding position-specific differences
- Supporting evidence-based recovery decisions
- Providing executive-ready dashboards for coaches and sports medicine staff

---

## Research Questions

This project answers several key questions:

- Which wellness indicators most strongly influence athlete wellbeing?
- Do wellness patterns differ across playing positions?
- How does athlete wellness change throughout the training week?
- Can survey-weighted statistical methods improve interpretation?
- How can wellness data support proactive recovery planning?

---

## Data

- NCAA Division I Men's Lacrosse Wellness Survey
- 1,054 daily wellness responses
- Five wellness indicators:
  - Sleep Quality
  - Motivation
  - Overall Stress
  - Physical Fatigue
  - Soreness

All player data was anonymized prior to analysis.

---

## Methodology

This project combines traditional statistical analysis with modern analytics techniques.

### Data Preparation

- Data cleaning
- Standardization
- Anonymization
- Feature engineering

### Survey Statistics

- Survey-weighted analysis
- Raking
- Bootstrap weights
- Confidence intervals

### Statistical Analysis

- Bootstrap estimation
- Rao–Scott Chi-Square Tests
- Survey-weighted GLM
- Position interaction models

### Predictive Analytics

- Regression modeling
- Machine Learning
- Model evaluation

### Business Intelligence

- Power BI Dashboard
- Executive KPIs
- Drill-through reports
- Interactive visualizations

---

# Key Findings

## Primary Drivers

The strongest predictors of athlete wellness were:

- 😴 Sleep Quality
- 💪 Motivation
- 📉 Overall Stress

These variables demonstrated the most consistent relationships with overall wellbeing.

---

## Secondary Drivers

Additional significant contributors included:

- Physical Fatigue
- Soreness

Although important, these variables showed smaller effects than the primary drivers.

---

## Position-Specific Findings

Survey-weighted analyses identified meaningful differences across playing positions.

Examples include:

- Defense players showed a stronger relationship between motivation and wellness.
- Goalkeepers reported the highest sleep quality.
- Faceoff specialists demonstrated lower overall wellness scores.
- Position-specific responses suggest individualized recovery strategies may be beneficial.

---

## Weekly Wellness Trends

Mid-week wellness monitoring emerged as the most valuable assessment period.

The analysis recommends:

- Tuesday as the weekly baseline.
- Thursday as the primary decision point for training adjustments.
- Friday readiness monitoring.
- Sunday post-game recovery assessments.

---

## Dashboard

The accompanying Power BI dashboard enables coaches and sports medicine staff to:

- Monitor athlete wellness
- Compare playing positions
- Track trends over time
- Identify athletes requiring intervention
- Explore interactive drill-through reports

(Add dashboard screenshots here)

---

## Technologies

- R
- Survey Package
- tidyverse
- ggplot2
- Power BI
- DAX
- Git
- GitHub

---

## Business Impact

This project demonstrates how modern analytics can transform athlete wellness monitoring from reactive reporting into proactive decision support.

The resulting framework supports:

- Evidence-based coaching decisions
- Individualized recovery strategies
- Improved monitoring consistency
- Enhanced communication between sports medicine and coaching staff
- A scalable foundation for predictive athlete readiness

---

## Future Development

Planned enhancements include:

- Integration with Catapult workload metrics
- VALD jump testing integration
- CMJ and RSI readiness modeling
- Predictive machine learning models
- R Shiny applications
- Real-time wellness monitoring
- AI-assisted decision support

---

## Repository Structure

analysis/

dashboard/

executive-summary/

modeling/

report/

visuals/

README.md

---

## Author

Anthony Benyarko

Data Analytics Professional specializing in survey statistics, predictive analytics, business intelligence, and decision science.

LinkedIn:
https://linkedin.com/in/anthony-benyarko
