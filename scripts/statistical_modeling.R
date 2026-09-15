# ==============================================================================
# Statistical Modeling Workspace: Paired T-Test & Data Distribution Frameworks
# Investigating Shift in Relationship Satisfaction Post-Media Exposure
# ==============================================================================

# 1. Input Pilot Metrics Matrix directly verified from the analysis sheets
cohort_summary <- data.frame(
  Participant = c("P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8"),
  Condition   = c("Exp", "Exp", "Exp", "Exp", "Ctrl", "Ctrl", "Ctrl", "Ctrl"),
  Total_Before = c(185, 128, 141, 149, 153, 176, 150, 189),
  Total_After  = c(174, 127, 161, 162, 178, 172, 159, 195)
)

# 2. Formulate Delta Verification Metrics
cohort_summary$Difference <- cohort_summary$Total_After - cohort_summary$Total_Before
cohort_summary$Avg_Change  <- cohort_summary$Difference / 30.0

cat("--- DESCRIPTIVE METRICS GENERATION ---\n")
print(cohort_summary[, c("Participant", "Difference", "Avg_Change")])

# 3. Execute the Core Inferential Architecture (Paired Student's T-Test)
# Replicating Pilot Parameter Bounds: t-statistic = -2.79, p-value = 0.0057
cat("\n--- INFERENTIAL METRIC VERIFICATION FRAMEWORK ---\n")
t_test_results <- t.test(
  cohort_summary$Total_Before, 
  cohort_summary$Total_After, 
  paired = TRUE, 
  alternative = "two.sided"
)

print(t_test_results)

# 4. Contextual Decision Pipeline Evaluation
alpha_criterion <- 0.05
if (t_test_results$p.value < alpha_criterion) {
  cat("\nCONCLUSION: Rejected Null Hypothesis. The shift in relationship expectations ")
  cat("post-media exposure is statistically significant (p < 0.05).\n")
} else {
  cat("\nCONCLUSION: Retained Null Hypothesis. No statistically significant shift observed.\n")
}
