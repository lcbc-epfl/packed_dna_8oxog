SI_October2023.pdf contains:
* A discussion of accounting for the finite size of the periodic simulation box
* Figures with the vertical energy gap distributions
* Tables with the RMSFs of DNA residues belonging in the QM region of all systems
* Tables with the identified DNA-protein close contacts
* Table of average hydrogen-bonding interactions with the defect regions and solvent molecules
* Table of average hydrogen-bonding eligible partners with the central base of the QM region and solvent molecules
* All 41 structural parameter distribution plots as well as select section-by-section structural parameter plots
* RMSF plots of base flexibility for four DNA sections
* DNA-water radial distribution functions for the phosphorous atoms of the DNA backbone near the quantum region and oxygen atoms in water
* DNA-water radial distribution functions for the N7 atom of the QM region central base and oxygen atoms in water
* Tables of means and standard deviations for all structural parameter plots

analysis directory contains:
* counting_protein_contacts.f90 : to calculate number of strong protein-DNA interactions 
* curves_scripts
* * curves_plots.ipynb : jupyter notebook to generate paramter distributions and statistics
  * curves_run_and_process_scripts
  * README exaplaining how to use the curves processing scripts in curves_run_and_process_scripts directory
* gromacs_hbond_readme : short description of how to count hydrogen bonds for classical MD trajectories
* rmsf_notebook.ipynb : jupyter notebook to generate rmsf plots 
* vertical_energy_gap_scripts to calculate energy differences between oxidized and reduced systems with the same coordinates
* * calc_gap.f90 (and affiliated .o file)
  * calc_gap_half.f90 (and affiliated .o file)
  * de_distr.f90 (and affiliated .o file)
  
classical_MD directory contains:
* N.B. Full trajectory files are too large for github or zenodo storage, so initial representative frames are found directly on zenodo
* 8oxoG_reg1 directory
  * 8oxoG_oxidized_reg1 : analogous to above
  * 8oxoG_reduced_reg1 : analogous to above
* 8oxoG_reg2 directory
  * 8oxoG_oxidized_reg2 : analogous to above
  * 8oxoG_reduced_reg2 : analogous to above
* rmsf directory contains section-by-section rmsf values by system resid
* wildtype directory
  * wt_oxidized_reg1
  * * wt_ox_reg1_mdrun.mdp : production run input for gromacs classical MD
    * wt_ox_reg1_structure.gro : strucutre input for gromacs classical MD
    * wt_ox_reg1_topology directory with all topology itp and top files
  * wt_oxidized_reg2 : analogous to above
  * wt_reduced_both : analogous to above
   
curves_runs directory contains:
* run_curves.sh : input run file for CURVES+
* 8oxoG_0_reg1_curves_data : csv files of all curves parameters (no DNA tails full csv, by section csv)
* 8oxoG_0_reg2_curves_data : analogous to above
* wt_0_curves_data : analogous to above

QMMM_MD directory contains:
* N.B. Full trajectory files are too large for github or zenodo storage, so initial representative frames are found directly on zenodo
* 8oxoG_reg1
* * 8oxoG_reg1_oxidized_qmmm
  * * cpmd.inp : input file for cpmd qmmmm md run
    * gromos.g96 : classical gromos structure input
    * gromos.inp : gromos input for classical mm part of qmmmm run
    * gromos.top : gromos topology
    * starting_structure.g96 : starting structure in g96 format
* * 8oxoG_reg1_reduced_qmmm : analogous to above
* 8oxoG_reg2
* * 8oxoG_reg2_oxidized_qmmm : analogous to above
* * 8oxoG_reg2_reduced_qmmm : analogous to above
* wt_reg1
* * wt_reg1_oxidized_qmmm : analogous to above
* * wt_reg1_reduced_qmmm : analogous to above
* wt_reg2
* * wt_reg2_oxidized_qmmm : analogous to above
* * wt_reg2_reduced_qmmm : analogous to above
   
wfn_optimization directory contains:
* wf_1.inp : example CPMD input for performing a wavefunction optimization for oxidized quantum region
* wf_0.inp : example CPMD input for performing a wavefunction optimization for reduced quantum region
