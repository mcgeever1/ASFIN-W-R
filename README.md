# State Welfare Spending and Tax Revenue Analysis

An econometric analysis examining the relationship between state tax revenue and welfare expenditures across all 50 U.S. states.

## Key Finding

**For every $1,000 in additional per capita tax revenue, states allocate approximately $216 to welfare spending per resident** - a remarkably stable relationship that persists across different model specifications and transcends political affiliations.

## Overview

This project demystifies state fiscal policy by quantifying how tax dollars translate into welfare spending. Using 2022 Census data, I establish an interpretable metric that helps citizens and policymakers understand state budget priorities beyond abstract billion-dollar figures.

## Data

- **Primary Source**: 2022 Annual Survey of State Government Finances (Census Bureau)
- **Additional Variables**: 
  - Regional classifications (Census divisions)
  - Real median household income (2020 Census)
  - Urbanization rates (2020 Census)
  - Political affiliation (2020 FEC election data)
- **Observations**: All 50 U.S. states
- **Key transformation**: All fiscal variables converted to per capita terms for comparability

## Methodology

The analysis employs three regression specifications:

1. **Baseline OLS**: Welfare per capita ~ Tax revenue per capita + controls
2. **Non-parametric**: Kernel regression with Epanechnikov weighting
3. **Political augmented**: Baseline + Trump 2020 vote share

All models consistently yield a marginal propensity to spend on welfare of ~0.216, with R² ≈ 0.59.

## Key Results

| Model | Tax Coefficient | Std. Error | R² | p-value |
|-------|----------------|------------|-----|---------|
| Baseline OLS | 0.2158 | 0.0355 | 0.588 | <0.001 |
| Kernel Regression | 0.2157 | - | 0.562 | <0.001 |
| With Political Controls | 0.2154 | 0.0301 | 0.528 | <0.001 |

**Surprising finding**: Political affiliation (Trump 2020 vote share) shows no statistical significance (p=0.977) in explaining welfare spending variations, suggesting fiscal constraints dominate ideological preferences.

## Replication

To replicate this analysis:

1. Download raw data from Census Bureau's [Annual Survey of State Government Finances](https://www.census.gov/programs-surveys/state.html)
   1.1 - Noted as "2022 Census of Governments, State Government Finance Tables" 
3. Run Stata `.do` files in sequence (01-03)
4. All tables and figures will be generated in the `/output` folder

## Requirements

- Stata 16+ (for regression analysis)
- Standard Stata packages (no additional installations needed)

## Author

**Ethan McGeever**  
Northeastern University | Economics Student  
Research Assistant for Professor Shariq Mohammed  

## License

This project is available under the MIT License - see LICENSE file for details.

## Acknowledgments

- Professor Josh Abel (Northeastern University) for project guidance
- Census Bureau for comprehensive state financial data
- Federal Election Commission for political data

---

*Original paper completed December 2024 for ECON 2560: Applied Econometrics*
