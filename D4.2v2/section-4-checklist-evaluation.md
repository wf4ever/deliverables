# 4. Checklist evaluation

Checklists are a widely used tool for controlling and managing quality assurance processes (@@ref - Jun has), and they have appeared in data quality assurance in initiatives such as [MIBBI](http://www.nature.com/nbt/journal/v26/n8/pdf/nbt.1411.pdf), which deals with coherent minimum reporting guidelines for scientific investigations.  These ideas have been generalized, initially in the MIM model (@@ref), and subsequently in the [Minim model](@@link), our adaptation of the MIM model to deal with a range of RO related quality concerns.  Conforming to a minimum information model gives rise to a notion of _completeness_, i.e. that all required information is present and available.

In our work, a _checklist_ is a set of requirements on a Research Object that can be used to determine whether or not all information required for some purpose is present, and that the provided information meets some additional criteria.  It is important to note that a checklist provides a measure of _fitness for purpose_ rather than some overall measure of quality.  We see this kind of fitness for purpose assessment as being of more practical use than a generic quality assessment, and indeed as the ultimate goal of any quality evaluation exercise.  The suitability for different purposes of a Research Object collection may be evaluated using different checklists: there is no single set of criteria that meaningfully apply in all situations.  This leads to a need to describe different quality requirements for different purposes.  This is the purpose of the Minim model.

The Minim model was introduced in D4.1, reflecting its development as of August 2012, but its design and use has substantially progressed since then:

- development and sandbox deployment of a web service for RO checklist evaluation
- development of a "traffic light" display of checklists results (for myExperiment integration and other uses)
- incorporation into work on RO stability and reliability evaluation (described below)
- new checklist designs for myExperiment RO quality display, based on scenarios articulated by Wf4Ever project user partners
- application of Minim-based checklists to detect workflow decay brought about by withdrawal of KEGG, and confirmation of accuracy of decay detection
- application of Minim-based checklists to other data quality applications described in the literature (chembox, qSKOS) (paper submitted to ISWC in-use track)
- refactoring of the Minim model, to extend coverage of MIM capabilities, and meed additional requirements arising from the applications mentioned above
- checklist evaluation code updated to use SPARQL 1.1 library in place of SPARQL 1.0 - significantly enhancing the expressive capability of the Minim model (paper published in e-science conference)


## Ontological models

### Minim definition

### Minim results

## Implementation and integration

* (including sequence diagrams as did it in the last devs. updates)

## Checklist results presentation

## Checklist applications

(covering different uses of checklists)


key points:

- updated Minim description model
- A new minim assessment result model
- The new traffic light-like visualisation of checklist assessment
- Accuracy assessment (kegg assessment)
- Function assessment (in-use paper)
- New/ongoing (placeholders)
  - New tool for creation of simple Minim checklists?
  - Performance improvement?

