%AW: see comments below. 0.9/1.

%Inclass assignment 8

%Using the swalign function
% A. Create a random DNA sequence of length 100. 
bases = 'ACTG';
seq_nums = randi(4, 1, 100);
sequence = bases(seq_nums);

% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
seq_nums2 = randi(4, 1, 20);
sequence2 = sequence;
sequence2(41:60) = bases(seq_nums2);

% C. run swalign on the two sequences with the default parameters
[score, align, start] = swalign(sequence, sequence2, 'Showscore', true);
disp(align)

% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 

%Aw: this uses the amino acid alphabet by default. use 'nt'. -0.05. 
[score2, align2, start2] = swalign(sequence, sequence2, 'GapOpen', 1, 'Showscore', true);
disp(' ')
disp(align2)

[score3, align3, start3] = swalign(sequence, sequence2, 'GapOpen', 20, 'Showscore', true);
disp(' ')
disp(align3)

% A much lower value for GapOpen does not penalize the sequence alignment
% much for having to skip base pairs. This allows the sequences to contain
% more gaps, leaving many gaps in the final alignment. However, a large
% value for GapOpen penalizes gaps in the alignment heavily. This forces
% the sequence alignment to essentially follow a close to 1-to-1 alignment
% of base pairs since any gaps would decrease the score significantly.

% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result

[score4, align4, start4] = swalign(sequence, sequence2, 'GapOpen', 1, 'ExtendGap', 15, 'Showscore', true);
disp(' ')
disp(align4)

% A low GapOpen value does not penalize the alignment much for skipping
% base pairs. However, a high ExtendGap value penalizes the alignment
% heavily for generating a gap of more than 1 base pair. This causes the
% alignment to have more small gaps with few large base pair skipping loops
% in the DNA.

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 

[score5, align5, start5] = swalign(sequence, sequence2, 'ExtendGap', 15, 'Showscore', true);
disp(' ')
disp(align5)

%AW: the question asked for a a low value of ExtendGap so it is the opposite - it will form fewer
% gaps but they will be larger. -0.05. 

% Without a low GapOpen value, the alignment will have fewer single gaps,
% as these will be more heavily penalized. The addition of a high ExtendGap
% score penalized larger gaps even more heavily. In combination, these two
% conditions create an alignment that has very few gaps at all, with the
% existing gaps being very short. The resulting alignment is most similar
% to creating a high GapOpen score, but penalized larger gaps to an even
% higher degree.
