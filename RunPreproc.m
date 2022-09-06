%-----------------------------------------------------------------------
% Job saved on 18-Aug-2022 14:18:13 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

subjects = [28 30 39 72 73 74 108 118 120 132 141 143 153 156 171 194 209 216 216]; % Replace with a list of all of the subjects you wish to analyze

user = getenv('USER'); % Will return the username for OSX operating systems

for subject=subjects

subject = num2str(subject, '%03d');

if exist(['/data/hu_kalus/ds000158/sub-' subject '/func/sub-' subject '_task-passivelistening_bold.nii']) == 0
    display('Run 1 has not been unzipped; unzipping now')
    gunzip(['/data/hu_kalus/ds000158/sub-' subject '/func/sub-' subject '_task-passivelistening_bold.nii.gz'])
else
    display('Run 1 is already unzipped; doing nothing')
end

if exist(['/data/hu_kalus/ds000158/sub-' subject '/anat/sub-' subject '_T1w.nii']) == 0
    display('Anatomical image has not been unzipped; unzipping now')
    gunzip(['/data/hu_kalus/ds000158/sub-' subject '/anat/sub-' subject '_T1w.nii.gz'])
else
    display('Anatomical image is already unzipped; doing nothing')
end


matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'input_name_1';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{['/data/hu_kalus/ds000158/sub-' subject '/func/sub-' subject '_task-passivelistening_bold.nii']}};
matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Named File Selector: input_name_1(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{2}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{3}.spm.temporal.st.scans{1}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
matlabbatch{3}.spm.temporal.st.nslices = 32;
matlabbatch{3}.spm.temporal.st.tr = 2;
matlabbatch{3}.spm.temporal.st.ta = 1.9375;
matlabbatch{3}.spm.temporal.st.so = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32];
matlabbatch{3}.spm.temporal.st.refslice = 31;
matlabbatch{3}.spm.temporal.st.prefix = 'a';
matlabbatch{4}.spm.spatial.coreg.estwrite.ref(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{4}.spm.spatial.coreg.estwrite.source = {['/data/hu_kalus/ds000158/sub-' subject '/anat/sub-' subject '_T1w.nii,1']};
matlabbatch{4}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
matlabbatch{5}.spm.spatial.coreg.estwrite.ref = {'/data/hu_kalus/spm12/canonical/avg152T1.nii,1'};
matlabbatch{5}.spm.spatial.coreg.estwrite.source(1) = cfg_dep('Coregister: Estimate & Reslice: Coregistered Images', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{5}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
matlabbatch{6}.spm.spatial.preproc.channel.vols(1) = cfg_dep('Coregister: Estimate & Reslice: Coregistered Images', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{6}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{6}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{6}.spm.spatial.preproc.channel.write = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(1).tpm = {'/afs/cbs.mpg.de/software/spm/12.7771/9.12/bullseye/tpm/TPM.nii,1'};
matlabbatch{6}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{6}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(2).tpm = {'/afs/cbs.mpg.de/software/spm/12.7771/9.12/bullseye/tpm/TPM.nii,2'};
matlabbatch{6}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{6}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(3).tpm = {'/afs/cbs.mpg.de/software/spm/12.7771/9.12/bullseye/tpm/TPM.nii,3'};
matlabbatch{6}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{6}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(4).tpm = {'/afs/cbs.mpg.de/software/spm/12.7771/9.12/bullseye/tpm/TPM.nii,4'};
matlabbatch{6}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{6}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(5).tpm = {'/afs/cbs.mpg.de/software/spm/12.7771/9.12/bullseye/tpm/TPM.nii,5'};
matlabbatch{6}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{6}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(6).tpm = {'/afs/cbs.mpg.de/software/spm/12.7771/9.12/bullseye/tpm/TPM.nii,6'};
matlabbatch{6}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{6}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{6}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{6}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{6}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{6}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{6}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{6}.spm.spatial.preproc.warp.write = [0 1];
matlabbatch{6}.spm.spatial.preproc.warp.vox = NaN;
matlabbatch{6}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                              NaN NaN NaN];
matlabbatch{7}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{7}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{7}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{7}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{7}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{7}.spm.spatial.normalise.write.woptions.prefix = 'w';
matlabbatch{8}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{8}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{8}.spm.spatial.smooth.dtype = 0;
matlabbatch{8}.spm.spatial.smooth.im = 0;
matlabbatch{8}.spm.spatial.smooth.prefix = 's';
matlabbatch{9}.cfg_basicio.file_dir.file_ops.cfg_file_split.name = 'set_file_name_1';
matlabbatch{9}.cfg_basicio.file_dir.file_ops.cfg_file_split.files(1) = cfg_dep('Smooth: Smoothed Images', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{9}.cfg_basicio.file_dir.file_ops.cfg_file_split.index = {1};
matlabbatch{10}.spm.stats.fmri_spec.dir = {['/data/hu_kalus/ds000158/sub-' subject '/1stLevel']};
matlabbatch{10}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{10}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{10}.spm.stats.fmri_spec.timing.fmri_t = 32;
matlabbatch{10}.spm.stats.fmri_spec.timing.fmri_t0 = 31;
matlabbatch{10}.spm.stats.fmri_spec.sess.scans(1) = cfg_dep('File Set Split: set_file_name_1 (1)', substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}));
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(1).name = 'vocal';
%%
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(1).onset = [22
                                                          62
                                                          82
                                                          112
                                                          132
                                                          162
                                                          202
                                                          222
                                                          242
                                                          262
                                                          312
                                                          352
                                                          372
                                                          402
                                                          432
                                                          462
                                                          482
                                                          512
                                                          542
                                                          572];
%%
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(1).duration = 8;
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(1).tmod = 0;
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(1).orth = 1;
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(2).name = 'nonvocal';
%%
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(2).onset = [12
                                                          32
                                                          52
                                                          102
                                                          122
                                                          142
                                                          182
                                                          232
                                                          282
                                                          302
                                                          322
                                                          342
                                                          382
                                                          422
                                                          442
                                                          472
                                                          502
                                                          522
                                                          552
                                                          592];
%%
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(2).duration = 8;
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(2).tmod = 0;
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{10}.spm.stats.fmri_spec.sess.cond(2).orth = 1;
matlabbatch{10}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{10}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{10}.spm.stats.fmri_spec.sess.multi_reg = {''};
matlabbatch{10}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{10}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{10}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{10}.spm.stats.fmri_spec.volt = 1;
matlabbatch{10}.spm.stats.fmri_spec.global = 'None';
matlabbatch{10}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{10}.spm.stats.fmri_spec.mask = {''};
matlabbatch{10}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{11}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{11}.spm.stats.fmri_est.write_residuals = 1;
matlabbatch{11}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{12}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{11}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{12}.spm.stats.con.consess{1}.tcon.name = 'vocal-nonvocal';
matlabbatch{12}.spm.stats.con.consess{1}.tcon.weights = [1 -1];
matlabbatch{12}.spm.stats.con.consess{1}.tcon.sessrep = 'replsc';
matlabbatch{12}.spm.stats.con.consess{2}.tcon.name = 'nonvocal-vocal';
matlabbatch{12}.spm.stats.con.consess{2}.tcon.weights = [-1 1];
matlabbatch{12}.spm.stats.con.consess{2}.tcon.sessrep = 'replsc';
matlabbatch{12}.spm.stats.con.consess{3}.tcon.name = 'Vocal';
matlabbatch{12}.spm.stats.con.consess{3}.tcon.weights = [1 0];
matlabbatch{12}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch{12}.spm.stats.con.consess{4}.tcon.name = 'nonvocal';
matlabbatch{12}.spm.stats.con.consess{4}.tcon.weights = [0 1];
matlabbatch{12}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
matlabbatch{12}.spm.stats.con.delete = 0;

spm_jobman('run', matlabbatch);

end
