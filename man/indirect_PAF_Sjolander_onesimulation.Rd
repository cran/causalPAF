% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/indirect_PAF_Sjolander_onesimulation.R
\name{indirect_PAF_Sjolander_onesimulation}
\alias{indirect_PAF_Sjolander_onesimulation}
\title{Calculation of Population Attributable Fraction (PAF), with a decomposition of the total PAF into direct
and indirect components.}
\usage{
indirect_PAF_Sjolander_onesimulation(
  data_frame,
  exposure,
  mediator,
  response,
  mediator_model,
  response_model,
  response_model_2,
  weights
)
}
\arguments{
\item{data_frame}{Data frame containing the data. The data frame has cases in rows and variables in columns.}

\item{exposure}{The exposure name in the form of character string e.g. "phys" for physical exercise.}

\item{mediator}{The mediator name in the form of character string e.g. "whr" for waist-hip ratio.}

\item{response}{The outcome name in the form of character string e.g. "case" for a stroke case.}

\item{mediator_model}{A list containing each of the fitted mediator regression models e.g.
\code{mediator_model=list(model_list[[6]],model_list[[7]],model_list[[8]])}.}

\item{response_model}{is a regression for the outcome on all mediators together with all parents and confounders of the mediators in
a Markov causal Bayesian network DAG e.g.}

\item{response_model_2}{is a regression for the outcome on the exposure together with  all parents and confounders of the exposure in
a Markov causal Bayesian network DAG along with other risk factors at the same level of the causal Bayesian network DAG. E.G. If
physical exercise ("exer") in the example given in the diagram is the exposure. Then the regression would include all
parents of "exer" (i.e. sex, region, educ, age) as well as risk factors at the same level of the causal Bayesian network
(i.e. stress, smoke, diet, alcoh).}

\item{weights}{A numeric \eqn{n x 1} vector where n is the number of patients in the case control data frame.
For case control studies, a reweighting approach is used which assumes the prevalence of disease,
\eqn{\pi} is known, and the sampled disease cases and controls are randomly selected from their respective populations.
We assume for simplicity that the case:control matching ratio is \eqn{1:r}, for some \eqn{r \ge 1}.
Under these assumptions, the components of the PAF can be found as the corresponding empirical expectations
and distributions in the re-weighted dataset where cases are assigned weights 1, and controls are assigned weights
 \eqn{(1\pi−1)/r}. Effectively then we can think of the reweighted population as a random sample.}
}
\value{
\item{totalPAF }{total PAF}
\item{directPAF}{direct PAF}
\item{indirectPAF}{indirect PAF}
}
\description{
Calculation of Population Attributable Fraction (PAF), with a decomposition of the total PAF into direct
and indirect components. It performs one simulation which can be combined with a bootstrap approach to
perform multiple simulations.\deqn{Total PAF = (P(Y=1)-P(Y_0=1)/P(Y=1)}. If we think of \eqn{Y_0} as the potential outcome for
an individual if they were never exposed to the risk factor, can be directly interpreted as the relative change in
disease prevalence if an exposure was absent from the population.
Sjolander introduced the ideas of mediation into the literature for PAF, defining a decomposition of the total PAF
 into direct and indirect components: \deqn{Direct PAF = (P(Y=1)-P(Y_{0,M}=1)/P(Y=1)} and
 \deqn{Indirect PAF = Total PAF - Direct PAF = (P(Y_{0,M}=1)-P(Y_{0,M_{0}}=1)/P(Y=1)}
\if{html}{\figure{CausalDAG.jpg} {options: width=100 alt="Causal Bayesian network DAG"} }
\if{latex}{\figure{CausalDAG.jpg}{options: width=1in}}
}
\keyword{internal}
