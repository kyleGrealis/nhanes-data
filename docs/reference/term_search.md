# Search NHANES Variables by Term or Phrase

A convenience wrapper around
[`nhanesA::nhanesSearch`](https://rdrr.io/pkg/nhanesA/man/nhanesSearch.html)
that returns a simplified, concise output focused on variable names,
descriptions, and survey years. Results are sorted by year (most recent
first) and then by variable name.

## Usage

``` r
term_search(var)
```

## Arguments

- var:

  Character. Search term or phrase to find in variable names or
  descriptions. Case-insensitive. Special regex characters are
  automatically escaped for literal matching.

## Value

A data.frame with 4 columns:

- `Variable.Name`: NHANES variable code

- `Variable.Description`: Description of the variable

- `Data.File.Name`: Name of the data file containing the variable

- `Begin.Year`: Starting year of the survey cycle (numeric)

Results are sorted by `Begin.Year` (descending) then `Variable.Name`.
Returns an empty data.frame with correct structure if no matches found.

## See also

[`var_search`](https://kyleGrealis.com/nhanesdata/reference/var_search.md)
for searching by exact variable name,
[`get_url`](https://kyleGrealis.com/nhanesdata/reference/get_url.md) for
getting documentation URLs,
[`nhanesSearch`](https://rdrr.io/pkg/nhanesA/man/nhanesSearch.html) for
the underlying search function

Other search and lookup functions:
[`get_url()`](https://kyleGrealis.com/nhanesdata/reference/get_url.md),
[`var_search()`](https://kyleGrealis.com/nhanesdata/reference/var_search.md)

## Examples

``` r
# Search for diabetes-related variables
term_search("diabetes")
#>     Variable.Name
#> 1          DID040
#> 2          DIQ010
#> 3          DIQ160
#> 4          DIQ180
#> 5          DID040
#> 6          DID040
#> 7          DIQ010
#> 8          DIQ010
#> 9          DIQ080
#> 10         DIQ080
#> 11         DIQ160
#> 12         DIQ160
#> 13         DIQ170
#> 14         DIQ172
#> 15        DIQ175A
#> 16        DIQ175B
#> 17        DIQ175C
#> 18        DIQ175D
#> 19        DIQ175E
#> 20        DIQ175F
#> 21        DIQ175G
#> 22        DIQ175H
#> 23        DIQ175I
#> 24        DIQ175J
#> 25        DIQ175K
#> 26        DIQ175L
#> 27        DIQ175M
#> 28        DIQ175N
#> 29        DIQ175O
#> 30        DIQ175P
#> 31        DIQ175Q
#> 32        DIQ175R
#> 33        DIQ175S
#> 34        DIQ175T
#> 35        DIQ175U
#> 36        DIQ175V
#> 37        DIQ175W
#> 38        DIQ175X
#> 39         DIQ180
#> 40         DIQ180
#> 41         DIQ230
#> 42         DIQ230
#> 43         DIQ240
#> 44         DIQ240
#> 45        MCQ300c
#> 46        MCQ300c
#> 47         RHQ162
#> 48         RHQ162
#> 49         RHQ163
#> 50         DID040
#> 51         DIQ010
#> 52         DIQ080
#> 53         DIQ160
#> 54         DIQ170
#> 55         DIQ172
#> 56        DIQ175A
#> 57        DIQ175B
#> 58        DIQ175C
#> 59        DIQ175D
#> 60        DIQ175E
#> 61        DIQ175F
#> 62        DIQ175G
#> 63        DIQ175H
#> 64        DIQ175I
#> 65        DIQ175J
#> 66        DIQ175K
#> 67        DIQ175L
#> 68        DIQ175M
#> 69        DIQ175N
#> 70        DIQ175O
#> 71        DIQ175P
#> 72        DIQ175Q
#> 73        DIQ175R
#> 74        DIQ175S
#> 75        DIQ175T
#> 76        DIQ175U
#> 77        DIQ175V
#> 78        DIQ175W
#> 79        DIQ175X
#> 80         DIQ180
#> 81         DIQ230
#> 82         DIQ240
#> 83        MCQ300c
#> 84         RHQ162
#> 85         RHQ163
#> 86         DID040
#> 87         DIQ010
#> 88         DIQ080
#> 89         DIQ160
#> 90         DIQ170
#> 91         DIQ172
#> 92        DIQ175A
#> 93        DIQ175B
#> 94        DIQ175C
#> 95        DIQ175D
#> 96        DIQ175E
#> 97        DIQ175F
#> 98        DIQ175G
#> 99        DIQ175H
#> 100       DIQ175I
#> 101       DIQ175J
#> 102       DIQ175K
#> 103       DIQ175L
#> 104       DIQ175M
#> 105       DIQ175N
#> 106       DIQ175O
#> 107       DIQ175P
#> 108       DIQ175Q
#> 109       DIQ175R
#> 110       DIQ175S
#> 111       DIQ175T
#> 112       DIQ175U
#> 113       DIQ175V
#> 114       DIQ175W
#> 115       DIQ175X
#> 116        DIQ180
#> 117        DIQ230
#> 118        DIQ240
#> 119       MCQ300c
#> 120        RHQ162
#> 121        RHQ163
#> 122        DID040
#> 123        DIQ010
#> 124        DIQ080
#> 125        DIQ160
#> 126        DIQ170
#> 127        DIQ172
#> 128       DIQ175A
#> 129       DIQ175B
#> 130       DIQ175C
#> 131       DIQ175D
#> 132       DIQ175E
#> 133       DIQ175F
#> 134       DIQ175G
#> 135       DIQ175H
#> 136       DIQ175I
#> 137       DIQ175J
#> 138       DIQ175K
#> 139       DIQ175L
#> 140       DIQ175M
#> 141       DIQ175N
#> 142       DIQ175O
#> 143       DIQ175P
#> 144       DIQ175Q
#> 145       DIQ175R
#> 146       DIQ175S
#> 147       DIQ175T
#> 148       DIQ175U
#> 149       DIQ175V
#> 150       DIQ175W
#> 151        DIQ180
#> 152        DIQ230
#> 153        DIQ240
#> 154       MCQ300c
#> 155        RHQ162
#> 156        RHQ163
#> 157        DID040
#> 158        DIQ010
#> 159        DIQ080
#> 160        DIQ160
#> 161        DIQ170
#> 162        DIQ180
#> 163        DIQ230
#> 164        DIQ240
#> 165       MCQ300C
#> 166        RHQ162
#> 167        RHQ163
#> 168        DID040
#> 169        DIQ010
#> 170        DIQ080
#> 171        DIQ160
#> 172        DIQ170
#> 173        DIQ180
#> 174        DIQ220
#> 175        DIQ230
#> 176        DIQ240
#> 177       MCQ300C
#> 178       PFD069F
#> 179        RHQ162
#> 180        RHQ163
#> 181        DID040
#> 182        DIQ010
#> 183        DIQ080
#> 184        DIQ160
#> 185        DIQ170
#> 186        DIQ180
#> 187        DIQ220
#> 188        DIQ230
#> 189        DIQ240
#> 190       MCQ300C
#> 191       PFD069F
#> 192       DID040G
#> 193       DID040Q
#> 194        DIQ010
#> 195        DIQ080
#> 196       MCQ250A
#> 197       PFD069F
#> 198       DID040G
#> 199       DID040Q
#> 200        DIQ010
#> 201        DIQ080
#> 202       MCQ250A
#> 203       PFD069F
#> 204        DIQ010
#> 205       DIQ040G
#> 206       DIQ040Q
#> 207        DIQ080
#> 208       MCQ250A
#> 209      PFQ069fG
#> 210      PFQ069fQ
#>                                                                                                                 Variable.Description
#> 1   How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 2   The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 3   {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 4                                   {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 5   How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 6   How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 7   The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 8   The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 9   Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 10  Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 11  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 12  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 13  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} health conditions or a medica
#> 14                                                  {Do you/Does SP} feel {you/he/she} could be at risk for diabetes or prediabetes?
#> 15                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 16                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 17                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 18                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 19                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 20                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 21                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 22                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 23                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 24                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 25                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 26                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 27                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 28                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 29                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 30                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 31                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 32                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 33                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 34                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 35                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 36                                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n
#> 37                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 38                           Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes? [Anything else?]
#> 39                                  {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 40                                  {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 41  When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 42  When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 43  Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 44  Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 45  Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 46  Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 47  During {any/your/SP's} pregnancy, {were you/was SP} ever told by a doctor or other health professional that {you/she} had diabet
#> 48  During {any/your/SP's} pregnancy, {were you/was SP} ever told by a doctor or other health professional that {you/she} had diabet
#> 49                           How old {were you/was SP} when {you were/she was} first told {you/she} had diabetes during a pregnancy?
#> 50  How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 51  The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 52  Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 53  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 54  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} health conditions or a medica
#> 55                                                  {Do you/Does SP} feel {you/he/she} could be at risk for diabetes or prediabetes?
#> 56                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 57                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 58                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 59                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 60                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 61                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 62                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 63                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 64                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 65                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 66                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 67                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 68                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 69                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 70                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 71                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 72                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 73                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 74                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 75                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 76                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 77                                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n
#> 78                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 79                           Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes? [Anything else?]
#> 80                                  {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 81  When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 82  Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 83  Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 84  During {any/your/SP's} pregnancy, {were you/was SP} ever told by a doctor or other health professional that {you/she} had diabet
#> 85                           How old {were you/was SP} when {you were/she was} first told {you/she} had diabetes during a pregnancy?
#> 86  How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 87  The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 88  Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 89  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 90  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} health conditions or a medica
#> 91                                                  {Do you/Does SP} feel {you/he/she} could be at risk for diabetes or prediabetes?
#> 92                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 93                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 94                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 95                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 96                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 97                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 98                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 99                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 100                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 101                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 102                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 103                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 104                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 105                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 106                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 107                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 108                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 109                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 110                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 111                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 112                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 113                                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n
#> 114                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 115                          Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes? [Anything else?]
#> 116                                 {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 117 When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 118 Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 119 Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 120 During {any/your/SP's} pregnancy, {were you/was SP} ever told by a doctor or other health professional that {you/she} had diabet
#> 121                          How old {were you/was SP} when {you were/she was} first told {you/she} had diabetes during a pregnancy?
#> 122 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 123 The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 124 Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 125 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 126 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} health conditions or a medica
#> 127                                                 {Do you/Does SP} feel {you/he/she} could be at risk for diabetes or prediabetes?
#> 128                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 129                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 130                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 131                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 132                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 133                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 134                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 135                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 136                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 137                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 138                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 139                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 140                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 141                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 142                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 143                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 144                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 145                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 146                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 147                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 148                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 149                                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n
#> 150                         Why {Do you/Does SP} think {you are/he is/she is} at risk for diabetes or prediabetes?\n[Anything else?]
#> 151                                 {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 152 When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 153 Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 154 Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 155 During {any/your/SP's} pregnancy, {were you/was SP} ever told by a doctor or other health professional that {you/she} had diabet
#> 156                          How old {were you/was SP} when {you were/she was} first told {you/she} had diabetes during a pregnancy?
#> 157 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 158 The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 159 Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 160 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 161 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} health conditions or a medica
#> 162                                 {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 163 When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 164 Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 165 Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 166 During {any/your/SP's} pregnancy, {were you/was SP} ever told by a doctor or other health professional that {you/she} had diabet
#> 167                          How old {were you/was SP} when {you were/she was} first told {you/she} had diabetes during a pregnancy?
#> 168 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 169 The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 170 Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 171 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 172 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} health conditions or a medica
#> 173                                 {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 174                                                                                         Was {your/his/her} diabetes diagnosed...
#> 175 When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 176 Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 177 Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 178                                                                           How long (have/has) (you/SP) had diabetes (# of days)?
#> 179 During {any/your/SP's} pregnancy, {were you/was SP} ever told by a doctor or other health professional that {you/she} had diabet
#> 180                          How old {were you/was SP} when {you were/she was} first told {you/she} had diabetes during a pregnancy?
#> 181 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 182 The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 183 Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy (ret-in-op-ath
#> 184 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/SP has} any of the following:  prediabe
#> 185 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} health conditions or a medica
#> 186                                 {Have you/Has SP} had a blood test for high blood sugar or diabetes within the past three years?
#> 187                                                                                         Was {your/his/her} diabetes diagnosed...
#> 188 When was the last time {you/SP} saw a diabetes nurse educator or dietitian or nutritionist for {your/his/her} diabetes?  Do not 
#> 189 Is there one doctor or other health professional {you usually see/SP usually sees} for {your/his/her} diabetes?  Do not include 
#> 190 Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 191                                                                           How long (have/has) (you/SP) had diabetes (# of days)?
#> 192 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 193 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 194 The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 195               Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy?
#> 196 Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 197                                                                           How long (have/has) (you/SP) had diabetes (# of days)?
#> 198 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 199 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 200 The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 201               Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy?
#> 202 Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 203                                                                           How long (have/has) (you/SP) had diabetes (# of days)?
#> 204 The next questions are about specific medical conditions. {Other than during pregnancy, {have you/has SP}/{Have you/Has SP}} eve
#> 205 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 206 How old {was SP/were you} when a doctor or other health professional first told {you/him/her} that {you/he/she} had diabetes or 
#> 207               Has a doctor ever told {you/SP} that diabetes has affected {your/his/her} eyes or that {you/s/he} had retinopathy?
#> 208 Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 209                                                                                       How long (have/has) (you/SP) had diabetes?
#> 210                                                                                         How long {have you/has SP} had diabetes?
#>     Data.File.Name Begin.Year
#> 1            DIQ_L       2021
#> 2            DIQ_L       2021
#> 3            DIQ_L       2021
#> 4            DIQ_L       2021
#> 5            DIQ_J       2017
#> 6            P_DIQ       2017
#> 7            DIQ_J       2017
#> 8            P_DIQ       2017
#> 9            DIQ_J       2017
#> 10           P_DIQ       2017
#> 11           DIQ_J       2017
#> 12           P_DIQ       2017
#> 13           DIQ_J       2017
#> 14           DIQ_J       2017
#> 15           DIQ_J       2017
#> 16           DIQ_J       2017
#> 17           DIQ_J       2017
#> 18           DIQ_J       2017
#> 19           DIQ_J       2017
#> 20           DIQ_J       2017
#> 21           DIQ_J       2017
#> 22           DIQ_J       2017
#> 23           DIQ_J       2017
#> 24           DIQ_J       2017
#> 25           DIQ_J       2017
#> 26           DIQ_J       2017
#> 27           DIQ_J       2017
#> 28           DIQ_J       2017
#> 29           DIQ_J       2017
#> 30           DIQ_J       2017
#> 31           DIQ_J       2017
#> 32           DIQ_J       2017
#> 33           DIQ_J       2017
#> 34           DIQ_J       2017
#> 35           DIQ_J       2017
#> 36           DIQ_J       2017
#> 37           DIQ_J       2017
#> 38           DIQ_J       2017
#> 39           DIQ_J       2017
#> 40           P_DIQ       2017
#> 41           DIQ_J       2017
#> 42           P_DIQ       2017
#> 43           DIQ_J       2017
#> 44           P_DIQ       2017
#> 45           MCQ_J       2017
#> 46           P_MCQ       2017
#> 47           RHQ_J       2017
#> 48           P_RHQ       2017
#> 49           RHQ_J       2017
#> 50           DIQ_I       2015
#> 51           DIQ_I       2015
#> 52           DIQ_I       2015
#> 53           DIQ_I       2015
#> 54           DIQ_I       2015
#> 55           DIQ_I       2015
#> 56           DIQ_I       2015
#> 57           DIQ_I       2015
#> 58           DIQ_I       2015
#> 59           DIQ_I       2015
#> 60           DIQ_I       2015
#> 61           DIQ_I       2015
#> 62           DIQ_I       2015
#> 63           DIQ_I       2015
#> 64           DIQ_I       2015
#> 65           DIQ_I       2015
#> 66           DIQ_I       2015
#> 67           DIQ_I       2015
#> 68           DIQ_I       2015
#> 69           DIQ_I       2015
#> 70           DIQ_I       2015
#> 71           DIQ_I       2015
#> 72           DIQ_I       2015
#> 73           DIQ_I       2015
#> 74           DIQ_I       2015
#> 75           DIQ_I       2015
#> 76           DIQ_I       2015
#> 77           DIQ_I       2015
#> 78           DIQ_I       2015
#> 79           DIQ_I       2015
#> 80           DIQ_I       2015
#> 81           DIQ_I       2015
#> 82           DIQ_I       2015
#> 83           MCQ_I       2015
#> 84           RHQ_I       2015
#> 85           RHQ_I       2015
#> 86           DIQ_H       2013
#> 87           DIQ_H       2013
#> 88           DIQ_H       2013
#> 89           DIQ_H       2013
#> 90           DIQ_H       2013
#> 91           DIQ_H       2013
#> 92           DIQ_H       2013
#> 93           DIQ_H       2013
#> 94           DIQ_H       2013
#> 95           DIQ_H       2013
#> 96           DIQ_H       2013
#> 97           DIQ_H       2013
#> 98           DIQ_H       2013
#> 99           DIQ_H       2013
#> 100          DIQ_H       2013
#> 101          DIQ_H       2013
#> 102          DIQ_H       2013
#> 103          DIQ_H       2013
#> 104          DIQ_H       2013
#> 105          DIQ_H       2013
#> 106          DIQ_H       2013
#> 107          DIQ_H       2013
#> 108          DIQ_H       2013
#> 109          DIQ_H       2013
#> 110          DIQ_H       2013
#> 111          DIQ_H       2013
#> 112          DIQ_H       2013
#> 113          DIQ_H       2013
#> 114          DIQ_H       2013
#> 115          DIQ_H       2013
#> 116          DIQ_H       2013
#> 117          DIQ_H       2013
#> 118          DIQ_H       2013
#> 119          MCQ_H       2013
#> 120          RHQ_H       2013
#> 121          RHQ_H       2013
#> 122          DIQ_G       2011
#> 123          DIQ_G       2011
#> 124          DIQ_G       2011
#> 125          DIQ_G       2011
#> 126          DIQ_G       2011
#> 127          DIQ_G       2011
#> 128          DIQ_G       2011
#> 129          DIQ_G       2011
#> 130          DIQ_G       2011
#> 131          DIQ_G       2011
#> 132          DIQ_G       2011
#> 133          DIQ_G       2011
#> 134          DIQ_G       2011
#> 135          DIQ_G       2011
#> 136          DIQ_G       2011
#> 137          DIQ_G       2011
#> 138          DIQ_G       2011
#> 139          DIQ_G       2011
#> 140          DIQ_G       2011
#> 141          DIQ_G       2011
#> 142          DIQ_G       2011
#> 143          DIQ_G       2011
#> 144          DIQ_G       2011
#> 145          DIQ_G       2011
#> 146          DIQ_G       2011
#> 147          DIQ_G       2011
#> 148          DIQ_G       2011
#> 149          DIQ_G       2011
#> 150          DIQ_G       2011
#> 151          DIQ_G       2011
#> 152          DIQ_G       2011
#> 153          DIQ_G       2011
#> 154          MCQ_G       2011
#> 155          RHQ_G       2011
#> 156          RHQ_G       2011
#> 157          DIQ_F       2009
#> 158          DIQ_F       2009
#> 159          DIQ_F       2009
#> 160          DIQ_F       2009
#> 161          DIQ_F       2009
#> 162          DIQ_F       2009
#> 163          DIQ_F       2009
#> 164          DIQ_F       2009
#> 165          MCQ_F       2009
#> 166          RHQ_F       2009
#> 167          RHQ_F       2009
#> 168          DIQ_E       2007
#> 169          DIQ_E       2007
#> 170          DIQ_E       2007
#> 171          DIQ_E       2007
#> 172          DIQ_E       2007
#> 173          DIQ_E       2007
#> 174          DIQ_E       2007
#> 175          DIQ_E       2007
#> 176          DIQ_E       2007
#> 177          MCQ_E       2007
#> 178          PFQ_E       2007
#> 179          RHQ_E       2007
#> 180          RHQ_E       2007
#> 181          DIQ_D       2005
#> 182          DIQ_D       2005
#> 183          DIQ_D       2005
#> 184          DIQ_D       2005
#> 185          DIQ_D       2005
#> 186          DIQ_D       2005
#> 187          DIQ_D       2005
#> 188          DIQ_D       2005
#> 189          DIQ_D       2005
#> 190          MCQ_D       2005
#> 191          PFQ_D       2005
#> 192          DIQ_C       2003
#> 193          DIQ_C       2003
#> 194          DIQ_C       2003
#> 195          DIQ_C       2003
#> 196          MCQ_C       2003
#> 197          PFQ_C       2003
#> 198          DIQ_B       2001
#> 199          DIQ_B       2001
#> 200          DIQ_B       2001
#> 201          DIQ_B       2001
#> 202          MCQ_B       2001
#> 203          PFQ_B       2001
#> 204            DIQ       1999
#> 205            DIQ       1999
#> 206            DIQ       1999
#> 207            DIQ       1999
#> 208            MCQ       1999
#> 209            PFQ       1999
#> 210            PFQ       1999

# Search for blood pressure measurements
term_search("blood pressure")
#>     Variable.Name
#> 1          BPQ020
#> 2          BPQ030
#> 3          BPQ150
#> 4        BPAOMNTS
#> 5          BPD035
#> 6          BPD035
#> 7          BPQ020
#> 8          BPQ020
#> 9          BPQ030
#> 10         BPQ030
#> 11        BPQ040A
#> 12        BPQ040A
#> 13         BPXDI1
#> 14         BPXDI2
#> 15         BPXDI3
#> 16         BPXDI4
#> 17         BPXSY1
#> 18         BPXSY2
#> 19         BPXSY3
#> 20         BPXSY4
#> 21        DID310D
#> 22        DID310D
#> 23        DID310S
#> 24        DID310S
#> 25        DIQ300D
#> 26        DIQ300D
#> 27        DIQ300S
#> 28        DIQ300S
#> 29       PEASCCT1
#> 30         BPD035
#> 31         BPQ020
#> 32         BPQ030
#> 33        BPQ040A
#> 34         BPXDI1
#> 35         BPXDI2
#> 36         BPXDI3
#> 37         BPXDI4
#> 38         BPXSY1
#> 39         BPXSY2
#> 40         BPXSY3
#> 41         BPXSY4
#> 42        DID310D
#> 43        DID310S
#> 44        DIQ300D
#> 45        DIQ300S
#> 46       PEASCCT1
#> 47         BPD035
#> 48         BPD058
#> 49         BPQ020
#> 50         BPQ030
#> 51        BPQ040A
#> 52         BPQ056
#> 53         BPQ059
#> 54         BPXDI1
#> 55         BPXDI2
#> 56         BPXDI3
#> 57         BPXDI4
#> 58         BPXSY1
#> 59         BPXSY2
#> 60         BPXSY3
#> 61         BPXSY4
#> 62        DID310D
#> 63        DID310S
#> 64        DIQ300D
#> 65        DIQ300S
#> 66       PEASCCT1
#> 67       PEASCST1
#> 68       PEASCTM1
#> 69         BPD035
#> 70         BPD058
#> 71         BPQ020
#> 72         BPQ030
#> 73        BPQ040A
#> 74         BPQ056
#> 75         BPQ057
#> 76         BPQ059
#> 77         BPXDI1
#> 78         BPXDI2
#> 79         BPXDI3
#> 80         BPXDI4
#> 81         BPXSY1
#> 82         BPXSY2
#> 83         BPXSY3
#> 84         BPXSY4
#> 85        DID310D
#> 86        DID310S
#> 87        DIQ300D
#> 88        DIQ300S
#> 89       PEASCCT1
#> 90       PEASCST1
#> 91       PEASCTM1
#> 92         BPD035
#> 93         BPD058
#> 94         BPQ020
#> 95         BPQ030
#> 96        BPQ040A
#> 97         BPQ056
#> 98         BPQ057
#> 99         BPQ059
#> 100        BPXDI1
#> 101        BPXDI2
#> 102        BPXDI3
#> 103        BPXDI4
#> 104        BPXSY1
#> 105        BPXSY2
#> 106        BPXSY3
#> 107        BPXSY4
#> 108      PEASCCT1
#> 109      PEASCST1
#> 110      PEASCTM1
#> 111        BPD035
#> 112        BPQ020
#> 113        BPQ030
#> 114       BPQ040A
#> 115        BPQ057
#> 116        BPXDI1
#> 117        BPXDI2
#> 118        BPXDI3
#> 119        BPXDI4
#> 120        BPXSY1
#> 121        BPXSY2
#> 122        BPXSY3
#> 123        BPXSY4
#> 124       DID310D
#> 125       DID310S
#> 126       DIQ300D
#> 127       DIQ300S
#> 128      PEASCCT1
#> 129      PEASCST1
#> 130      PEASCTM1
#> 131       PFD069J
#> 132        BPQ020
#> 133        BPQ030
#> 134       BPQ040A
#> 135        BPXDI1
#> 136        BPXDI2
#> 137        BPXDI3
#> 138        BPXDI4
#> 139        BPXSY1
#> 140        BPXSY2
#> 141        BPXSY3
#> 142        BPXSY4
#> 143       DID310D
#> 144       DID310S
#> 145       DIQ300D
#> 146       DIQ300S
#> 147      PEASCCT1
#> 148      PEASCST1
#> 149      PEASCTM1
#> 150       PFD069J
#> 151        BPQ010
#> 152        BPQ020
#> 153        BPQ030
#> 154       BPQ040A
#> 155       BPQ040B
#> 156       BPQ040C
#> 157       BPQ040D
#> 158       BPQ040E
#> 159       BPQ040F
#> 160        BPXDI1
#> 161        BPXDI2
#> 162        BPXDI3
#> 163        BPXDI4
#> 164        BPXSY1
#> 165        BPXSY2
#> 166        BPXSY3
#> 167        BPXSY4
#> 168        CVAARM
#> 169       CVACUFF
#> 170       CVDR1DI
#> 171       CVDR1SY
#> 172       CVDR2DI
#> 173       CVDR2SY
#> 174       CVDR3DI
#> 175       CVDR3SY
#> 176       CVDS1DI
#> 177       CVDS1SY
#> 178       CVDS2DI
#> 179       CVDS2SY
#> 180        CVDWDI
#> 181        CVDWSY
#> 182       CVQ220c
#> 183       CVQ220e
#> 184      LEALAPNC
#> 185      LEARAPNC
#> 186       LEXBRP1
#> 187       LEXBRP2
#> 188       LEXBRPM
#> 189      LEXLPTS1
#> 190      LEXLPTS2
#> 191      LEXLPTSM
#> 192      LEXRPTS1
#> 193      LEXRPTS2
#> 194      LEXRPTSM
#> 195       MCQ250F
#> 196      PEASCCT1
#> 197      PEASCST1
#> 198      PEASCTM1
#> 199       PFD069J
#> 200        BPQ010
#> 201        BPQ020
#> 202        BPQ030
#> 203       BPQ040A
#> 204       BPQ040B
#> 205       BPQ040C
#> 206       BPQ040D
#> 207       BPQ040E
#> 208       BPQ040F
#> 209        BPXDAR
#> 210        BPXDI1
#> 211        BPXDI2
#> 212        BPXDI3
#> 213        BPXDI4
#> 214        BPXSAR
#> 215        BPXSY1
#> 216        BPXSY2
#> 217        BPXSY3
#> 218        BPXSY4
#> 219        CVAARM
#> 220       CVACUFF
#> 221       CVDR1DI
#> 222       CVDR1SY
#> 223       CVDR2DI
#> 224       CVDR2SY
#> 225       CVDR3DI
#> 226       CVDR3SY
#> 227       CVDS1DI
#> 228       CVDS1SY
#> 229       CVDS2DI
#> 230       CVDS2SY
#> 231        CVDWDI
#> 232        CVDWSY
#> 233       CVQ220c
#> 234       CVQ220e
#> 235      LEALAPNC
#> 236      LEARAPNC
#> 237       LEXBRP1
#> 238       LEXBRP2
#> 239       LEXBRPM
#> 240      LEXLPTS1
#> 241      LEXLPTS2
#> 242      LEXLPTSM
#> 243      LEXRPTS1
#> 244      LEXRPTS2
#> 245      LEXRPTSM
#> 246       MCQ250F
#> 247      PEASCCT1
#> 248      PEASCST1
#> 249      PEASCTM1
#> 250       PFD069J
#> 251        BPQ010
#> 252        BPQ020
#> 253        BPQ030
#> 254       BPQ040A
#> 255       BPQ040B
#> 256       BPQ040C
#> 257       BPQ040D
#> 258       BPQ040E
#> 259       BPQ040F
#> 260        BPXDAR
#> 261        BPXDI1
#> 262        BPXDI2
#> 263        BPXDI3
#> 264        BPXDI4
#> 265        BPXSAR
#> 266        BPXSY1
#> 267        BPXSY2
#> 268        BPXSY3
#> 269        BPXSY4
#> 270        CVAARM
#> 271       CVACUFF
#> 272       CVDR1DI
#> 273       CVDR1SY
#> 274       CVDR2DI
#> 275       CVDR2SY
#> 276       CVDR3DI
#> 277       CVDR3SY
#> 278       CVDS1DI
#> 279       CVDS1SY
#> 280       CVDS2DI
#> 281       CVDS2SY
#> 282        CVDWDI
#> 283        CVDWSY
#> 284       CVQ220c
#> 285       CVQ220e
#> 286       LEXBRP1
#> 287       LEXBRP2
#> 288       LEXBRPM
#> 289      LEXLPTS1
#> 290      LEXLPTS2
#> 291      LEXLPTSM
#> 292      LEXRPTS1
#> 293      LEXRPTS2
#> 294      LEXRPTSM
#> 295        MCQ100
#> 296        MCQ110
#> 297       MCQ250F
#> 298      PEASCCT1
#> 299      PEASCST1
#> 300      PEASCTM1
#> 301      PFD069jG
#> 302      PFD069jQ
#>                                                                                                                 Variable.Description
#> 1   {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 2            {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 3                      {Are you/Is SP} now taking any medication prescribed by a doctor for {your/his/her/SP's} high blood pressure?
#> 4   Difference in minutes between blood pressure obtained by a physician with a mercury sphygmomanometer (legacy) and blood pressure
#> 5         How old {were you/was SP} when {you were/he/she was} first told that {you/he/she} had hypertension or high blood pressure?
#> 6         How old {were you/was SP} when {you were/he/she was} first told that {you/he/she} had hypertension or high blood pressure?
#> 7   {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 8   {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 9            {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 10           {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 11  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 12  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 13                                                                                  Diastolic:  Blood pressure (first reading) mm Hg
#> 14                                                                                  Diastolic: Blood pressure (second reading) mm Hg
#> 15                                                                                   Diastolic: Blood pressure (third reading) mm Hg
#> 16                                                                     Diastolic: Blood pressure (fourth reading if necessary) mm Hg
#> 17                                                                                   Systolic:  Blood pressure (first reading) mm Hg
#> 18                                                                                  Systolic:  Blood pressure (second reading) mm Hg
#> 19                                                                                   Systolic:  Blood pressure (third reading) mm Hg
#> 20                                                                     Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 21                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 22                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 23                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 24                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 25       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 26       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 27       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 28       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 29                                                                                                            Blood Pressure Comment
#> 30        How old {were you/was SP} when {you were/he/she was} first told that {you/he/she} had hypertension or high blood pressure?
#> 31  {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 32           {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 33  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 34                                                                                  Diastolic:  Blood pressure (first reading) mm Hg
#> 35                                                                                  Diastolic: Blood pressure (second reading) mm Hg
#> 36                                                                                   Diastolic: Blood pressure (third reading) mm Hg
#> 37                                                                     Diastolic: Blood pressure (fourth reading if necessary) mm Hg
#> 38                                                                                   Systolic:  Blood pressure (first reading) mm Hg
#> 39                                                                                  Systolic:  Blood pressure (second reading) mm Hg
#> 40                                                                                   Systolic:  Blood pressure (third reading) mm Hg
#> 41                                                                     Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 42                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 43                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 44       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 45       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 46                                                                                                            Blood Pressure Comment
#> 47        How old {were you/was SP} when {you were/he/she was} first told that {you/he/she} had hypertension or high blood pressure?
#> 48                             How often {did you check your/did SP check his/her} blood pressure at home during the last 12 months?
#> 49  {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 50           {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 51  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 52                                            {Did you/Did SP} take {your/his/her} blood pressure at home during the last 12 months?
#> 53                            Did a doctor or other health professional tell {you/SP} to take {your/his/her} blood pressure at home?
#> 54                                                                                  Diastolic:  Blood pressure (first reading) mm Hg
#> 55                                                                                  Diastolic: Blood pressure (second reading) mm Hg
#> 56                                                                                   Diastolic: Blood pressure (third reading) mm Hg
#> 57                                                                     Diastolic: Blood pressure (fourth reading if necessary) mm Hg
#> 58                                                                                   Systolic:  Blood pressure (first reading) mm Hg
#> 59                                                                                  Systolic:  Blood pressure (second reading) mm Hg
#> 60                                                                                   Systolic:  Blood pressure (third reading) mm Hg
#> 61                                                                     Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 62                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 63                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 64       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 65       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 66                                                                                                            Blood Pressure Comment
#> 67                                                                                                             Blood Pressure Status
#> 68                                                                                                    Blood Pressure Time in Seconds
#> 69        How old {were you/was SP} when {you were/he/she was} first told that {you/he/she} had hypertension or high blood pressure?
#> 70                             How often {did you check your/did SP check his/her} blood pressure at home during the last 12 months?
#> 71  {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 72           {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 73  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 74                                            {Did you/Did SP} take {your/his/her} blood pressure at home during the last 12 months?
#> 75  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} high normal blood pressure or
#> 76                            Did a doctor or other health professional tell {you/SP} to take {your/his/her} blood pressure at home?
#> 77                                                                                  Diastolic:  Blood pressure (first reading) mm Hg
#> 78                                                                                  Diastolic: Blood pressure (second reading) mm Hg
#> 79                                                                                   Diastolic: Blood pressure (third reading) mm Hg
#> 80                                                                     Diastolic: Blood pressure (fourth reading if necessary) mm Hg
#> 81                                                                                   Systolic:  Blood pressure (first reading) mm Hg
#> 82                                                                                  Systolic:  Blood pressure (second reading) mm Hg
#> 83                                                                                   Systolic:  Blood pressure (third reading) mm Hg
#> 84                                                                     Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 85                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 86                        What does {your/SP's} doctor or other health professional say {your/his/her} \n\nblood pressure should be?
#> 87       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 88       Blood pressure is usually given as one number over another. What was \n\n{your/SP's} most recent blood pressure in numbers?
#> 89                                                                                                            Blood Pressure Comment
#> 90                                                                                                             Blood Pressure Status
#> 91                                                                                                    Blood Pressure Time in Seconds
#> 92        How old {were you/was SP} when {you were/he/she was} first told that {you/he/she} had hypertension or high blood pressure?
#> 93                             How often {did you check your/did SP check his/her} blood pressure at home during the last 12 months?
#> 94  {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 95           {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 96  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 97                                            {Did you/Did SP} take {your/his/her} blood pressure at home during the last 12 months?
#> 98  {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} high normal blood pressure or
#> 99                            Did a doctor or other health professional tell {you/SP} to take {your/his/her} blood pressure at home?
#> 100                                                                                 Diastolic:  Blood pressure (first reading) mm Hg
#> 101                                                                                 Diastolic: Blood pressure (second reading) mm Hg
#> 102                                                                                  Diastolic: Blood pressure (third reading) mm Hg
#> 103                                                                   Diastolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 104                                                                                  Systolic:  Blood pressure (first reading) mm Hg
#> 105                                                                                 Systolic:  Blood pressure (second reading) mm Hg
#> 106                                                                                  Systolic:  Blood pressure (third reading) mm Hg
#> 107                                                                    Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 108                                                                                                           Blood Pressure Comment
#> 109                                                                                                            Blood Pressure Status
#> 110                                                                                                   Blood Pressure Time in Seconds
#> 111       How old {were you/was SP} when {you were/he/she was} first told that {you/he/she} had hypertension or high blood pressure?
#> 112 {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 113          {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 114 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 115 {Have you/Has SP} ever been told by a doctor or other health professional that {you have/s/he has} high normal blood pressure or
#> 116                                                                                 Diastolic:  Blood pressure (first reading) mm Hg
#> 117                                                                                 Diastolic: Blood pressure (second reading) mm Hg
#> 118                                                                                  Diastolic: Blood pressure (third reading) mm Hg
#> 119                                                                   Diastolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 120                                                                                  Systolic:  Blood pressure (first reading) mm Hg
#> 121                                                                                 Systolic:  Blood pressure (second reading) mm Hg
#> 122                                                                                  Systolic:  Blood pressure (third reading) mm Hg
#> 123                                                                    Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 124                           What does {your/SP's} doctor or other health professional say {your/his/her} blood pressure should be?
#> 125                           What does {your/SP's} doctor or other health professional say {your/his/her} blood pressure should be?
#> 126         Blood pressure is usually given as one number over another.  What was {your/SP's} most recent blood pressure in numbers?
#> 127         Blood pressure is usually given as one number over another.  What was {your/SP's} most recent blood pressure in numbers?
#> 128                                                                                                           Blood Pressure Comment
#> 129                                                                                                            Blood Pressure Status
#> 130                                                                                                   Blood Pressure Time in Seconds
#> 131                                                How long (have/has) (you/SP) had hypertension or high blood pressure (# of days)?
#> 132 {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 133          {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 134 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 135                                                                                 Diastolic:  Blood pressure (first reading) mm Hg
#> 136                                                                                 Diastolic: Blood pressure (second reading) mm Hg
#> 137                                                                                  Diastolic: Blood pressure (third reading) mm Hg
#> 138                                                                   Diastolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 139                                                                                  Systolic:  Blood pressure (first reading) mm Hg
#> 140                                                                                 Systolic:  Blood pressure (second reading) mm Hg
#> 141                                                                                  Systolic:  Blood pressure (third reading) mm Hg
#> 142                                                                    Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 143                           What does {your/SP's} doctor or other health professional say {your/his/her} blood pressure should be?
#> 144                           What does {your/SP's} doctor or other health professional say {your/his/her} blood pressure should be?
#> 145         Blood pressure is usually given as one number over another.  What was {your/SP's} most recent blood pressure in numbers?
#> 146         Blood pressure is usually given as one number over another.  What was {your/SP's} most recent blood pressure in numbers?
#> 147                                                                                                           Blood Pressure Comment
#> 148                                                                                                            Blood Pressure Status
#> 149                                                                                                   Blood Pressure Time in Seconds
#> 150                                                How long (have/has) (you/SP) had hypertension or high blood pressure (# of days)?
#> 151 About how long has it been since {you/SP} last had {your/his/her} blood pressure taken by a doctor or other health professional?
#> 152 {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 153          {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 154 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 155 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to control {your/his/her} weight o
#> 156 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to cut down on salt or sodium in {
#> 157                  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to exercise more?
#> 158 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to cut down {your/his/her} alcohol
#> 159              Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to do something else?
#> 160                                                                                 Diastolic:  Blood pressure (first reading) mm Hg
#> 161                                                                                 Diastolic: Blood pressure (second reading) mm Hg
#> 162                                                                                  Diastolic: Blood pressure (third reading) mm Hg
#> 163                                                                   Diastolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 164                                                                                  Systolic:  Blood pressure (first reading) mm Hg
#> 165                                                                                 Systolic:  Blood pressure (second reading) mm Hg
#> 166                                                                                  Systolic:  Blood pressure (third reading) mm Hg
#> 167                                                                    Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 168                                                                                       Arm selected for blood pressure monitoring
#> 169                                                                                     Cuff size used for blood pressure monitoring
#> 170                                                                                      Recovery 1 diastolic blood pressure (mm Hg)
#> 171                                                                                       Recovery 1 systolic blood pressure (mm Hg)
#> 172                                                                                      Recovery 2 diastolic blood pressure (mm Hg)
#> 173                                                                                       Recovery 2 systolic blood pressure (mm Hg)
#> 174                                                                                      Recovery 3 diastolic blood pressure (mm Hg)
#> 175                                                                                       Recovery 3 systolic blood pressure (mm Hg)
#> 176                                                                                         Stage 1 diastolic blood pressure (mm Hg)
#> 177                                                                                          Stage 1 systolic blood pressure (mm Hg)
#> 178                                                                                         Stage 2 diastolic blood pressure (mm Hg)
#> 179                                                                                          Stage 2 systolic blood pressure (mm Hg)
#> 180                                                                                         Warm-up diastolic blood pressure (mm Hg)
#> 181                                                                                          Warm-up systolic blood pressure (mm Hg)
#> 182                        Reason for Priority 2 Stop: Exercise blood pressure exceeds 260 mmHg systolic and/or 115 mmHg diastolic\n
#> 183                             Reason for Priority 2 Stop: Significant drop (> 20 mm Hg) in systolic blood pressure during exercise
#> 184                                                                                  Left ankle systolic blood pressure > 255 mm Hg?
#> 185                                                                                 Right ankle systolic blood pressure > 255 mm Hg?
#> 186                                                                   Brachial systolic blood pressure 1 (in millimeters of mercury)
#> 187                                                                   Brachial systolic blood pressure 2 (in millimeters of mercury)
#> 188                                                                Mean brachial systolic blood pressure (in millimeters of mercury)
#> 189                                                      Left posterior tibial systolic blood pressure 1 (in millimeters of mercury)
#> 190                                                      Left posterior tibial systolic blood pressure 2 (in millimeters of mercury)
#> 191                                                   Left mean posterior tibial systolic blood pressure (in millimeters of mercury)
#> 192                                                     Right posterior tibial systolic blood pressure 1 (in millimeters of mercury)
#> 193                                                     Right posterior tibial systolic blood pressure 2 (in millimeters of mercury)
#> 194                                                 Right mean posterior tibial systolic blood pressure (in millimeters of mercury) 
#> 195 Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 196                                                                                                           Blood Pressure Comment
#> 197                                                                                                            Blood Pressure Status
#> 198                                                                                                   Blood Pressure Time in Seconds
#> 199                                                How long (have/has) (you/SP) had hypertension or high blood pressure (# of days)?
#> 200 About how long has it been since {you/SP} last had {your/his/her} blood pressure taken by a doctor or other health professional?
#> 201 {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 202          {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 203 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 204 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to control {your/his/her} weight o
#> 205 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to cut down on salt or sodium in {
#> 206                  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to exercise more?
#> 207 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to cut down {your/his/her} alcohol
#> 208              Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to do something else?
#> 209                                                                                                Diastolic blood pressure average:
#> 210                                                                                 Diastolic:  Blood pressure (first reading) mm Hg
#> 211                                                                                 Diastolic: Blood pressure (second reading) mm Hg
#> 212                                                                                  Diastolic: Blood pressure (third reading) mm Hg
#> 213                                                                   Diastolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 214                                                                                                 Systolic blood pressure average:
#> 215                                                                                  Systolic:  Blood pressure (first reading) mm Hg
#> 216                                                                                 Systolic:  Blood pressure (second reading) mm Hg
#> 217                                                                                  Systolic:  Blood pressure (third reading) mm Hg
#> 218                                                                    Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 219                                                                                       Arm selected for blood pressure monitoring
#> 220                                                                                     Cuff size used for blood pressure monitoring
#> 221                                                                                      Recovery 1 diastolic blood pressure (mm Hg)
#> 222                                                                                       Recovery 1 systolic blood pressure (mm Hg)
#> 223                                                                                      Recovery 2 diastolic blood pressure (mm Hg)
#> 224                                                                                       Recovery 2 systolic blood pressure (mm Hg)
#> 225                                                                                      Recovery 3 diastolic blood pressure (mm Hg)
#> 226                                                                                       Recovery 3 systolic blood pressure (mm Hg)
#> 227                                                                                         Stage 1 diastolic blood pressure (mm Hg)
#> 228                                                                                          Stage 1 systolic blood pressure (mm Hg)
#> 229                                                                                         Stage 2 diastolic blood pressure (mm Hg)
#> 230                                                                                          Stage 2 systolic blood pressure (mm Hg)
#> 231                                                                                         Warm-up diastolic blood pressure (mm Hg)
#> 232                                                                                          Warm-up systolic blood pressure (mm Hg)
#> 233                        Reason for Priority 2 Stop: Exercise blood pressure exceeds 260 mmHg systolic and/or 115 mmHg diastolic\n
#> 234                             Reason for Priority 2 Stop: Significant drop (> 20 mm Hg) in systolic blood pressure during exercise
#> 235                                                                                  Left ankle systolic blood pressure > 255 mm Hg?
#> 236                                                                                 Right ankle systolic blood pressure > 255 mm Hg?
#> 237                                                                   Brachial systolic blood pressure 1 (in millimeters of mercury)
#> 238                                                                   Brachial systolic blood pressure 2 (in millimeters of mercury)
#> 239                                                                Mean brachial systolic blood pressure (in millimeters of mercury)
#> 240                                                      Left posterior tibial systolic blood pressure 1 (in millimeters of mercury)
#> 241                                                      Left posterior tibial systolic blood pressure 2 (in millimeters of mercury)
#> 242                                                   Left mean posterior tibial systolic blood pressure (in millimeters of mercury)
#> 243                                                     Right posterior tibial systolic blood pressure 1 (in millimeters of mercury)
#> 244                                                     Right posterior tibial systolic blood pressure 2 (in millimeters of mercury)
#> 245                                                 Right mean posterior tibial systolic blood pressure (in millimeters of mercury) 
#> 246 Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 247                                                                                                           Blood Pressure Comment
#> 248                                                                                                            Blood Pressure Status
#> 249                                                                                                   Blood Pressure Time in Seconds
#> 250                                                How long (have/has) (you/SP) had hypertension or high blood pressure (# of days)?
#> 251 About how long has it been since {you/SP} last had {your/his/her} blood pressure taken by a doctor or other health professional?
#> 252 {Have you/Has SP} ever been told by a doctor or other health professional that {you/s/he} had hypertension, also called high blo
#> 253          {Were you/Was SP} told on 2 or more different visits that {you/s/he} had hypertension, also called high blood pressure?
#> 254 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to . . . take prescribed medicine?
#> 255 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to control {your/his/her} weight o
#> 256 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to cut down on salt or sodium in {
#> 257                  Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to exercise more?
#> 258 Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to cut down {your/his/her} alcohol
#> 259              Because of {your/SP's} (high blood pressure/hypertension), {have you/has s/he} ever been told to do something else?
#> 260                                                                                                Diastolic blood pressure average:
#> 261                                                                                 Diastolic:  Blood pressure (first reading) mm Hg
#> 262                                                                                 Diastolic: Blood pressure (second reading) mm Hg
#> 263                                                                                  Diastolic: Blood pressure (third reading) mm Hg
#> 264                                                                   Diastolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 265                                                                                                 Systolic blood pressure average:
#> 266                                                                                  Systolic:  Blood pressure (first reading) mm Hg
#> 267                                                                                 Systolic:  Blood pressure (second reading) mm Hg
#> 268                                                                                  Systolic:  Blood pressure (third reading) mm Hg
#> 269                                                                    Systolic:  Blood pressure (fourth reading if necessary) mm Hg
#> 270                                                                                       Arm selected for blood pressure monitoring
#> 271                                                                                     Cuff size used for blood pressure monitoring
#> 272                                                                                      Recovery 1 diastolic blood pressure (mm Hg)
#> 273                                                                                       Recovery 1 systolic blood pressure (mm Hg)
#> 274                                                                                      Recovery 2 diastolic blood pressure (mm Hg)
#> 275                                                                                       Recovery 2 systolic blood pressure (mm Hg)
#> 276                                                                                      Recovery 3 diastolic blood pressure (mm Hg)
#> 277                                                                                       Recovery 3 systolic blood pressure (mm Hg)
#> 278                                                                                         Stage 1 diastolic blood pressure (mm Hg)
#> 279                                                                                          Stage 1 systolic blood pressure (mm Hg)
#> 280                                                                                         Stage 2 diastolic blood pressure (mm Hg)
#> 281                                                                                          Stage 2 systolic blood pressure (mm Hg)
#> 282                                                                                         Warm-up diastolic blood pressure (mm Hg)
#> 283                                                                                          Warm-up systolic blood pressure (mm Hg)
#> 284                        Reason for Priority 2 Stop: Exercise blood pressure exceeds 260 mmHg systolic and/or 115 mmHg diastolic\n
#> 285                             Reason for Priority 2 Stop: Significant drop (> 20 mm Hg) in systolic blood pressure during exercise
#> 286                                                                   Brachial systolic blood pressure 1 (in millimeters of mercury)
#> 287                                                                   Brachial systolic blood pressure 2 (in millimeters of mercury)
#> 288                                                                Mean brachial systolic blood pressure (in millimeters of mercury)
#> 289                                                      Left posterior tibial systolic blood pressure 1 (in millimeters of mercury)
#> 290                                                      Left posterior tibial systolic blood pressure 2 (in millimeters of mercury)
#> 291                                                   Left mean posterior tibial systolic blood pressure (in millimeters of mercury)
#> 292                                                     Right posterior tibial systolic blood pressure 1 (in millimeters of mercury)
#> 293                                                     Right posterior tibial systolic blood pressure 2 (in millimeters of mercury)
#> 294                                                  Right mean posterior tibial systolic blood pressure (in millimeters of mercury)
#> 295                Has a doctor or health professional ever told {SP} that {s/he} had hypertension, also called high blood pressure?
#> 296                                     Because of {SP's} high blood pressure [hypertension], is {he/she} currently taking medicine?
#> 297 Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 298                                                                                                           Blood Pressure Comment
#> 299                                                                                                            Blood Pressure Status
#> 300                                                                                                   Blood Pressure Time in Seconds
#> 301                                                            How long (have/has) (you/SP) had hypertension or high blood pressure?
#> 302                                                              How long {have you/has SP} had hypertension or high blood pressure?
#>     Data.File.Name Begin.Year
#> 1            BPQ_L       2021
#> 2            BPQ_L       2021
#> 3            BPQ_L       2021
#> 4           BPXO_J       2017
#> 5            BPQ_J       2017
#> 6            P_BPQ       2017
#> 7            BPQ_J       2017
#> 8            P_BPQ       2017
#> 9            BPQ_J       2017
#> 10           P_BPQ       2017
#> 11           BPQ_J       2017
#> 12           P_BPQ       2017
#> 13           BPX_J       2017
#> 14           BPX_J       2017
#> 15           BPX_J       2017
#> 16           BPX_J       2017
#> 17           BPX_J       2017
#> 18           BPX_J       2017
#> 19           BPX_J       2017
#> 20           BPX_J       2017
#> 21           DIQ_J       2017
#> 22           P_DIQ       2017
#> 23           DIQ_J       2017
#> 24           P_DIQ       2017
#> 25           DIQ_J       2017
#> 26           P_DIQ       2017
#> 27           DIQ_J       2017
#> 28           P_DIQ       2017
#> 29           BPX_J       2017
#> 30           BPQ_I       2015
#> 31           BPQ_I       2015
#> 32           BPQ_I       2015
#> 33           BPQ_I       2015
#> 34           BPX_I       2015
#> 35           BPX_I       2015
#> 36           BPX_I       2015
#> 37           BPX_I       2015
#> 38           BPX_I       2015
#> 39           BPX_I       2015
#> 40           BPX_I       2015
#> 41           BPX_I       2015
#> 42           DIQ_I       2015
#> 43           DIQ_I       2015
#> 44           DIQ_I       2015
#> 45           DIQ_I       2015
#> 46           BPX_I       2015
#> 47           BPQ_H       2013
#> 48           BPQ_H       2013
#> 49           BPQ_H       2013
#> 50           BPQ_H       2013
#> 51           BPQ_H       2013
#> 52           BPQ_H       2013
#> 53           BPQ_H       2013
#> 54           BPX_H       2013
#> 55           BPX_H       2013
#> 56           BPX_H       2013
#> 57           BPX_H       2013
#> 58           BPX_H       2013
#> 59           BPX_H       2013
#> 60           BPX_H       2013
#> 61           BPX_H       2013
#> 62           DIQ_H       2013
#> 63           DIQ_H       2013
#> 64           DIQ_H       2013
#> 65           DIQ_H       2013
#> 66           BPX_H       2013
#> 67           BPX_H       2013
#> 68           BPX_H       2013
#> 69           BPQ_G       2011
#> 70           BPQ_G       2011
#> 71           BPQ_G       2011
#> 72           BPQ_G       2011
#> 73           BPQ_G       2011
#> 74           BPQ_G       2011
#> 75           BPQ_G       2011
#> 76           BPQ_G       2011
#> 77           BPX_G       2011
#> 78           BPX_G       2011
#> 79           BPX_G       2011
#> 80           BPX_G       2011
#> 81           BPX_G       2011
#> 82           BPX_G       2011
#> 83           BPX_G       2011
#> 84           BPX_G       2011
#> 85           DIQ_G       2011
#> 86           DIQ_G       2011
#> 87           DIQ_G       2011
#> 88           DIQ_G       2011
#> 89           BPX_G       2011
#> 90           BPX_G       2011
#> 91           BPX_G       2011
#> 92           BPQ_F       2009
#> 93           BPQ_F       2009
#> 94           BPQ_F       2009
#> 95           BPQ_F       2009
#> 96           BPQ_F       2009
#> 97           BPQ_F       2009
#> 98           BPQ_F       2009
#> 99           BPQ_F       2009
#> 100          BPX_F       2009
#> 101          BPX_F       2009
#> 102          BPX_F       2009
#> 103          BPX_F       2009
#> 104          BPX_F       2009
#> 105          BPX_F       2009
#> 106          BPX_F       2009
#> 107          BPX_F       2009
#> 108          BPX_F       2009
#> 109          BPX_F       2009
#> 110          BPX_F       2009
#> 111          BPQ_E       2007
#> 112          BPQ_E       2007
#> 113          BPQ_E       2007
#> 114          BPQ_E       2007
#> 115          BPQ_E       2007
#> 116          BPX_E       2007
#> 117          BPX_E       2007
#> 118          BPX_E       2007
#> 119          BPX_E       2007
#> 120          BPX_E       2007
#> 121          BPX_E       2007
#> 122          BPX_E       2007
#> 123          BPX_E       2007
#> 124          DIQ_E       2007
#> 125          DIQ_E       2007
#> 126          DIQ_E       2007
#> 127          DIQ_E       2007
#> 128          BPX_E       2007
#> 129          BPX_E       2007
#> 130          BPX_E       2007
#> 131          PFQ_E       2007
#> 132          BPQ_D       2005
#> 133          BPQ_D       2005
#> 134          BPQ_D       2005
#> 135          BPX_D       2005
#> 136          BPX_D       2005
#> 137          BPX_D       2005
#> 138          BPX_D       2005
#> 139          BPX_D       2005
#> 140          BPX_D       2005
#> 141          BPX_D       2005
#> 142          BPX_D       2005
#> 143          DIQ_D       2005
#> 144          DIQ_D       2005
#> 145          DIQ_D       2005
#> 146          DIQ_D       2005
#> 147          BPX_D       2005
#> 148          BPX_D       2005
#> 149          BPX_D       2005
#> 150          PFQ_D       2005
#> 151          BPQ_C       2003
#> 152          BPQ_C       2003
#> 153          BPQ_C       2003
#> 154          BPQ_C       2003
#> 155          BPQ_C       2003
#> 156          BPQ_C       2003
#> 157          BPQ_C       2003
#> 158          BPQ_C       2003
#> 159          BPQ_C       2003
#> 160          BPX_C       2003
#> 161          BPX_C       2003
#> 162          BPX_C       2003
#> 163          BPX_C       2003
#> 164          BPX_C       2003
#> 165          BPX_C       2003
#> 166          BPX_C       2003
#> 167          BPX_C       2003
#> 168          CVX_C       2003
#> 169          CVX_C       2003
#> 170          CVX_C       2003
#> 171          CVX_C       2003
#> 172          CVX_C       2003
#> 173          CVX_C       2003
#> 174          CVX_C       2003
#> 175          CVX_C       2003
#> 176          CVX_C       2003
#> 177          CVX_C       2003
#> 178          CVX_C       2003
#> 179          CVX_C       2003
#> 180          CVX_C       2003
#> 181          CVX_C       2003
#> 182          CVX_C       2003
#> 183          CVX_C       2003
#> 184        LEXAB_C       2003
#> 185        LEXAB_C       2003
#> 186        LEXAB_C       2003
#> 187        LEXAB_C       2003
#> 188        LEXAB_C       2003
#> 189        LEXAB_C       2003
#> 190        LEXAB_C       2003
#> 191        LEXAB_C       2003
#> 192        LEXAB_C       2003
#> 193        LEXAB_C       2003
#> 194        LEXAB_C       2003
#> 195          MCQ_C       2003
#> 196          BPX_C       2003
#> 197          BPX_C       2003
#> 198          BPX_C       2003
#> 199          PFQ_C       2003
#> 200          BPQ_B       2001
#> 201          BPQ_B       2001
#> 202          BPQ_B       2001
#> 203          BPQ_B       2001
#> 204          BPQ_B       2001
#> 205          BPQ_B       2001
#> 206          BPQ_B       2001
#> 207          BPQ_B       2001
#> 208          BPQ_B       2001
#> 209          BPX_B       2001
#> 210          BPX_B       2001
#> 211          BPX_B       2001
#> 212          BPX_B       2001
#> 213          BPX_B       2001
#> 214          BPX_B       2001
#> 215          BPX_B       2001
#> 216          BPX_B       2001
#> 217          BPX_B       2001
#> 218          BPX_B       2001
#> 219          CVX_B       2001
#> 220          CVX_B       2001
#> 221          CVX_B       2001
#> 222          CVX_B       2001
#> 223          CVX_B       2001
#> 224          CVX_B       2001
#> 225          CVX_B       2001
#> 226          CVX_B       2001
#> 227          CVX_B       2001
#> 228          CVX_B       2001
#> 229          CVX_B       2001
#> 230          CVX_B       2001
#> 231          CVX_B       2001
#> 232          CVX_B       2001
#> 233          CVX_B       2001
#> 234          CVX_B       2001
#> 235        LEXAB_B       2001
#> 236        LEXAB_B       2001
#> 237        LEXAB_B       2001
#> 238        LEXAB_B       2001
#> 239        LEXAB_B       2001
#> 240        LEXAB_B       2001
#> 241        LEXAB_B       2001
#> 242        LEXAB_B       2001
#> 243        LEXAB_B       2001
#> 244        LEXAB_B       2001
#> 245        LEXAB_B       2001
#> 246          MCQ_B       2001
#> 247          BPX_B       2001
#> 248          BPX_B       2001
#> 249          BPX_B       2001
#> 250          PFQ_B       2001
#> 251            BPQ       1999
#> 252            BPQ       1999
#> 253            BPQ       1999
#> 254            BPQ       1999
#> 255            BPQ       1999
#> 256            BPQ       1999
#> 257            BPQ       1999
#> 258            BPQ       1999
#> 259            BPQ       1999
#> 260            BPX       1999
#> 261            BPX       1999
#> 262            BPX       1999
#> 263            BPX       1999
#> 264            BPX       1999
#> 265            BPX       1999
#> 266            BPX       1999
#> 267            BPX       1999
#> 268            BPX       1999
#> 269            BPX       1999
#> 270            CVX       1999
#> 271            CVX       1999
#> 272            CVX       1999
#> 273            CVX       1999
#> 274            CVX       1999
#> 275            CVX       1999
#> 276            CVX       1999
#> 277            CVX       1999
#> 278            CVX       1999
#> 279            CVX       1999
#> 280            CVX       1999
#> 281            CVX       1999
#> 282            CVX       1999
#> 283            CVX       1999
#> 284            CVX       1999
#> 285            CVX       1999
#> 286        LEXABPI       1999
#> 287        LEXABPI       1999
#> 288        LEXABPI       1999
#> 289        LEXABPI       1999
#> 290        LEXABPI       1999
#> 291        LEXABPI       1999
#> 292        LEXABPI       1999
#> 293        LEXABPI       1999
#> 294        LEXABPI       1999
#> 295            MCQ       1999
#> 296            MCQ       1999
#> 297            MCQ       1999
#> 298            BPX       1999
#> 299            BPX       1999
#> 300            BPX       1999
#> 301            PFQ       1999
#> 302            PFQ       1999

# Search for demographic variables
term_search("age")
#>      Variable.Name
#> 1          ACD010A
#> 2          ACD010B
#> 3          ACD010C
#> 4           ACD040
#> 5           ALQ121
#> 6           ALQ130
#> 7           ALQ142
#> 8           ALQ151
#> 9           ALQ170
#> 10          DIQ070
#> 11        DMDHRAGZ
#> 12        DR1TNUMF
#> 13        DR2TNUMF
#> 14          FNQ080
#> 15          FNQ120
#> 16          FNQ130
#> 17          FNQ170
#> 18          FNQ450
#> 19          HIQ210
#> 20          KIQ005
#> 21          KIQ052
#> 22          RHQ131
#> 23        RIDAGEMN
#> 24        RIDAGEYR
#> 25        RIDEXAGM
#> 26        RIDEXPRG
#> 27          SMD470
#> 28         ACD011A
#> 29         ACD011A
#> 30         ACD011B
#> 31         ACD011B
#> 32         ACD011C
#> 33         ACD011C
#> 34          ACD040
#> 35          ACD040
#> 36          ACD110
#> 37          ACD110
#> 38        AIALANGA
#> 39        AIALANGA
#> 40          ALQ111
#> 41          ALQ111
#> 42          ALQ121
#> 43          ALQ121
#> 44          ALQ130
#> 45          ALQ130
#> 46          ALQ142
#> 47          ALQ142
#> 48          ALQ151
#> 49          ALQ151
#> 50          ALQ170
#> 51          ALQ170
#> 52          AUQ153
#> 53          AUQ153
#> 54          AUQ156
#> 55          AUQ156
#> 56          AUQ440
#> 57          AUQ440
#> 58          CBD071
#> 59          CBQ503
#> 60          CBQ503
#> 61          CBQ503
#> 62          CBQ503
#> 63          CBQ506
#> 64          CBQ506
#> 65          CBQ506
#> 66          CBQ506
#> 67          CBQ536
#> 68          CBQ536
#> 69          CBQ536
#> 70          CBQ536
#> 71          CBQ645
#> 72          CBQ645
#> 73          CBQ700
#> 74          CBQ700
#> 75          CBQ700
#> 76          CBQ700
#> 77          CBQ845
#> 78          CBQ845
#> 79          CBQ845
#> 80          CBQ845
#> 81          CBQ850
#> 82          CBQ850
#> 83          CBQ850
#> 84          CBQ850
#> 85          CBQ860
#> 86          CBQ860
#> 87          CBQ860
#> 88          CBQ860
#> 89          CBQ865
#> 90          CBQ865
#> 91          CBQ865
#> 92          CBQ865
#> 93          CBQ905
#> 94          CBQ905
#> 95          CBQ905
#> 96          CBQ905
#> 97          CBQ935
#> 98          CBQ935
#> 99          CBQ935
#> 100         CBQ935
#> 101         CBQ950
#> 102         CBQ950
#> 103         CBQ950
#> 104         CBQ950
#> 105        DBQ235A
#> 106        DBQ235A
#> 107        DBQ235B
#> 108        DBQ235B
#> 109        DBQ235C
#> 110        DBQ235C
#> 111         DBQ770
#> 112         DBQ770
#> 113         DBQ770
#> 114         DBQ770
#> 115         DBQ780
#> 116         DBQ780
#> 117         DBQ780
#> 118         DBQ780
#> 119         DIQ070
#> 120         DIQ070
#> 121         DIQ275
#> 122         DIQ275
#> 123       DMDHHSZA
#> 124       DMDHHSZB
#> 125       DMDHHSZE
#> 126       DMDHRAGZ
#> 127       DR1TNUMF
#> 128       DR1TNUMF
#> 129       DR2TNUMF
#> 130       DR2TNUMF
#> 131        FIALANG
#> 132        FIALANG
#> 133       FSD652ZW
#> 134       FSD652ZW
#> 135         FSD680
#> 136         FSD680
#> 137         FSQ760
#> 138         FSQ760
#> 139       HIQ031AA
#> 140         HIQ210
#> 141         HIQ210
#> 142         INQ020
#> 143         KIQ005
#> 144         KIQ005
#> 145         KIQ050
#> 146         KIQ050
#> 147         KIQ052
#> 148         KIQ052
#> 149        MCQ300a
#> 150        MCQ300a
#> 151        MIALANG
#> 152        MIALANG
#> 153        OHQ555G
#> 154        OHQ555G
#> 155        OHQ555Q
#> 156        OHQ555Q
#> 157        OHQ555U
#> 158        OHQ555U
#> 159        OHQ560G
#> 160        OHQ560G
#> 161        OHQ560Q
#> 162        OHQ560Q
#> 163        OHQ560U
#> 164        OHQ560U
#> 165         OHQ849
#> 166         OHQ849
#> 167        OSD110a
#> 168        OSD110a
#> 169        OSD110b
#> 170        OSD110b
#> 171        OSD110c
#> 172        OSD110c
#> 173        OSD110d
#> 174        OSD110d
#> 175        OSD110e
#> 176        OSD110e
#> 177        OSD110f
#> 178        OSD110f
#> 179        OSD110j
#> 180        OSD110j
#> 181         OSQ080
#> 182         OSQ080
#> 183        OSQ120a
#> 184        OSQ120a
#> 185        OSQ120b
#> 186        OSQ120b
#> 187        OSQ120c
#> 188        OSQ120c
#> 189        OSQ120d
#> 190        OSQ120d
#> 191        OSQ120e
#> 192        OSQ120e
#> 193        OSQ120f
#> 194        OSQ120f
#> 195        OSQ120g
#> 196        OSQ120g
#> 197        OSQ120h
#> 198        OSQ120h
#> 199        OSQ120i
#> 200        OSQ120i
#> 201        OSQ120j
#> 202        OSQ120j
#> 203         PAQ710
#> 204         PAQ715
#> 205         RHQ131
#> 206         RHQ131
#> 207         RHQ160
#> 208         RHQ160
#> 209       RIDAGEMN
#> 210       RIDAGEMN
#> 211       RIDAGEYR
#> 212       RIDAGEYR
#> 213       RIDEXAGM
#> 214       RIDEXPRG
#> 215       RIDEXPRG
#> 216        SIALANG
#> 217        SIALANG
#> 218         SMD470
#> 219         SMD470
#> 220         SMD480
#> 221         SMQ817
#> 222         SMQ817
#> 223        VTQ200A
#> 224        VTQ200A
#> 225         VTQ210
#> 226         VTQ210
#> 227         WHD120
#> 228         WHD120
#> 229         WHD130
#> 230         WHD130
#> 231         WHQ150
#> 232         WHQ150
#> 233        ACD011A
#> 234        ACD011B
#> 235        ACD011C
#> 236         ACD040
#> 237         ACD110
#> 238       AIALANGA
#> 239         ALQ101
#> 240         ALQ110
#> 241        ALQ120Q
#> 242         ALQ130
#> 243        ALQ141Q
#> 244         ALQ151
#> 245         AUQ154
#> 246       BMDAVSAD
#> 247         CBD071
#> 248        DBQ235A
#> 249        DBQ235B
#> 250        DBQ235C
#> 251         DIQ070
#> 252         DIQ275
#> 253       DMDHHSZA
#> 254       DMDHHSZB
#> 255       DMDHHSZE
#> 256       DMDHRAGE
#> 257       DR1TNUMF
#> 258       DR2TNUMF
#> 259        FIALANG
#> 260       FSD652ZW
#> 261         FSD680
#> 262         FSQ760
#> 263       HIQ031AA
#> 264         HIQ210
#> 265         INQ020
#> 266         KIQ005
#> 267         KIQ050
#> 268         KIQ052
#> 269         LBDPFL
#> 270         LBDWFL
#> 271        MCQ240h
#> 272        MCQ300a
#> 273        MIALANG
#> 274         OCQ630
#> 275         OCQ660
#> 276        OHQ555G
#> 277        OHQ555Q
#> 278        OHQ555U
#> 279        OHQ560G
#> 280        OHQ560Q
#> 281        OHQ560U
#> 282         OHQ849
#> 283         PAD733
#> 284         PAQ710
#> 285         PAQ715
#> 286         PAQ748
#> 287         PAQ766
#> 288         RHQ131
#> 289         RHQ160
#> 290       RIDAGEMN
#> 291       RIDAGEYR
#> 292       RIDAGGRP
#> 293       RIDAGGRP
#> 294       RIDAGGRP
#> 295       RIDAGGRP
#> 296       RIDEXAGM
#> 297       RIDEXPRG
#> 298        SIALANG
#> 299         SMD470
#> 300         SMD480
#> 301         SMQ817
#> 302        VTQ200A
#> 303         VTQ210
#> 304         WHD120
#> 305         WHD130
#> 306         WHQ150
#> 307        ACD011A
#> 308        ACD011B
#> 309        ACD011C
#> 310         ACD040
#> 311         ACD110
#> 312       AIALANGA
#> 313         ALQ101
#> 314         ALQ110
#> 315        ALQ120Q
#> 316         ALQ130
#> 317        ALQ141Q
#> 318         ALQ151
#> 319       BMDAVSAD
#> 320        CFALANG
#> 321        DBQ235A
#> 322        DBQ235B
#> 323        DBQ235C
#> 324         DIQ070
#> 325         DIQ275
#> 326       DMDHHSZA
#> 327       DMDHHSZB
#> 328       DMDHHSZE
#> 329       DMDHRAGE
#> 330       DR1TNUMF
#> 331       DR2TNUMF
#> 332       DXXBICDE
#> 333       DXXBICDE
#> 334       DXXBICDE
#> 335       DXXBICDE
#> 336       DXXBICDE
#> 337       DXXBICDE
#> 338       DXXBICDE
#> 339       DXXBICDE
#> 340       DXXBICDE
#> 341       DXXBICDE
#> 342       DXXBICDE
#> 343       DXXBICDE
#> 344       DXXBICDE
#> 345       DXXCRUDE
#> 346       DXXCRUDE
#> 347       DXXCRUDE
#> 348       DXXCRUDE
#> 349       DXXCRUDE
#> 350       DXXCRUDE
#> 351       DXXCRUDE
#> 352       DXXCRUDE
#> 353       DXXCRUDE
#> 354       DXXCRUDE
#> 355       DXXCRUDE
#> 356       DXXCRUDE
#> 357       DXXCRUDE
#> 358       DXXPRVFX
#> 359       DXXWDGDE
#> 360       DXXWDGDE
#> 361       DXXWDGDE
#> 362       DXXWDGDE
#> 363       DXXWDGDE
#> 364       DXXWDGDE
#> 365       DXXWDGDE
#> 366       DXXWDGDE
#> 367       DXXWDGDE
#> 368       DXXWDGDE
#> 369       DXXWDGDE
#> 370       DXXWDGDE
#> 371       DXXWDGDE
#> 372        FIALANG
#> 373         FSD680
#> 374       HIQ031AA
#> 375         HIQ210
#> 376         INQ020
#> 377         KIQ005
#> 378         KIQ050
#> 379         KIQ052
#> 380         LBDPFL
#> 381         LBDWFL
#> 382        MCQ240h
#> 383        MCQ300a
#> 384        MIALANG
#> 385         OCD231
#> 386         OCD391
#> 387        OHQ555G
#> 388        OHQ555Q
#> 389        OHQ555U
#> 390        OHQ560G
#> 391        OHQ560Q
#> 392        OHQ560U
#> 393         OHQ849
#> 394        OSD110a
#> 395        OSD110b
#> 396        OSD110c
#> 397        OSD110d
#> 398        OSD110e
#> 399        OSD110g
#> 400         OSQ080
#> 401        OSQ120a
#> 402        OSQ120b
#> 403        OSQ120c
#> 404        OSQ120d
#> 405        OSQ120e
#> 406        OSQ120f
#> 407        OSQ120g
#> 408        OSQ120h
#> 409         PAD733
#> 410         PAQ710
#> 411         PAQ715
#> 412         PAQ748
#> 413         PAQ766
#> 414         RHQ131
#> 415         RHQ160
#> 416       RIDAGEMN
#> 417       RIDAGEYR
#> 418       RIDAGGRP
#> 419       RIDAGGRP
#> 420       RIDAGGRP
#> 421       RIDAGGRP
#> 422       RIDEXAGM
#> 423       RIDEXPRG
#> 424        SIALANG
#> 425         SMD470
#> 426         SMD480
#> 427         SMQ817
#> 428        VTQ200A
#> 429        VTQ200A
#> 430         VTQ210
#> 431         VTQ210
#> 432         WHD120
#> 433         WHD130
#> 434         WHQ150
#> 435        ACD011A
#> 436        ACD011B
#> 437        ACD011C
#> 438         ACD040
#> 439         ACD110
#> 440       AIALANGA
#> 441         ALQ101
#> 442         ALQ110
#> 443        ALQ120Q
#> 444         ALQ130
#> 445        ALQ141Q
#> 446         ALQ151
#> 447         ALQ155
#> 448         AUQ154
#> 449         CBQ605
#> 450        CFALANG
#> 451        DBQ235A
#> 452        DBQ235B
#> 453        DBQ235C
#> 454         DIQ070
#> 455         DIQ275
#> 456       DMDHHSZA
#> 457       DMDHHSZB
#> 458       DMDHHSZE
#> 459       DMDHRAGE
#> 460         ENQ070
#> 461        FIALANG
#> 462         FSD680
#> 463         HCQ150
#> 464       HIQ031AA
#> 465         HIQ210
#> 466         INQ020
#> 467         KIQ005
#> 468         KIQ050
#> 469         KIQ052
#> 470        MCQ240h
#> 471        MCQ300a
#> 472        MIALANG
#> 473         OCD231
#> 474         OCD391
#> 475         PAQ710
#> 476         PAQ715
#> 477         RDQ090
#> 478         RHQ131
#> 479         RHQ160
#> 480       RIDAGEMN
#> 481       RIDAGEYR
#> 482       RIDAGGRP
#> 483       RIDAGGRP
#> 484       RIDAGGRP
#> 485       RIDAGGRP
#> 486       RIDEXAGM
#> 487       RIDEXAGY
#> 488       RIDEXPRG
#> 489        SIALANG
#> 490         SMQ817
#> 491        VTQ200A
#> 492         VTQ210
#> 493         WHD120
#> 494         WHD130
#> 495         WHQ150
#> 496        ACD010A
#> 497        ACD010B
#> 498        ACD010C
#> 499         ACD040
#> 500        AIALANG
#> 501         ALQ101
#> 502         ALQ110
#> 503        ALQ120Q
#> 504         ALQ130
#> 505        ALQ140Q
#> 506         ALQ150
#> 507        ARD026G
#> 508        ARQ020G
#> 509       ARQ021AG
#> 510       ARQ021BG
#> 511       ARQ021CG
#> 512       ARQ022AG
#> 513        ARQ022G
#> 514       ARQ023GG
#> 515       ARQ023QG
#> 516        ARQ024G
#> 517        ARQ025G
#> 518         BHQ010
#> 519         BHQ020
#> 520         BHQ030
#> 521         BHQ040
#> 522         CBD620
#> 523         CBD625
#> 524         CBD630
#> 525         CBD635
#> 526         CBD637
#> 527         CBD640
#> 528         CBD740
#> 529         CBD740
#> 530         CBQ503
#> 531         CBQ503
#> 532         CBQ605
#> 533         CBQ605
#> 534         CBQ645
#> 535        CBQ695A
#> 536        CBQ695B
#> 537        CBQ695C
#> 538        CBQ695a
#> 539        CBQ695b
#> 540        CBQ695c
#> 541         CBQ700
#> 542         CBQ700
#> 543        DBQ235A
#> 544        DBQ235B
#> 545        DBQ235C
#> 546         DBQ750
#> 547         DBQ750
#> 548         DBQ780
#> 549         DBQ780
#> 550         DIQ070
#> 551       DMDHRAGE
#> 552        DTD170Q
#> 553         ENQ070
#> 554        FIALANG
#> 555         FSD680
#> 556         HCQ150
#> 557       HIQ031AA
#> 558         HIQ210
#> 559         INQ020
#> 560         KIQ005
#> 561         KIQ050
#> 562         KIQ052
#> 563        MCQ240H
#> 564        MCQ300A
#> 565        MIALANG
#> 566         OCD231
#> 567         OCD391
#> 568        OSD110a
#> 569        OSD110b
#> 570        OSD110c
#> 571        OSD110d
#> 572        OSD110e
#> 573        OSD110f
#> 574         OSQ080
#> 575        OSQ120a
#> 576        OSQ120b
#> 577        OSQ120c
#> 578        OSQ120d
#> 579        OSQ120e
#> 580        OSQ120f
#> 581        OSQ120g
#> 582        OSQ120h
#> 583        OSQ120i
#> 584        OSQ120j
#> 585         PAD590
#> 586         PAD600
#> 587         RDQ090
#> 588         RHQ131
#> 589         RHQ160
#> 590       RIDAGEEX
#> 591       RIDAGEMN
#> 592       RIDAGEYR
#> 593       RIDAGGRP
#> 594       RIDAGGRP
#> 595       RIDAGGRP
#> 596       RIDAGGRP
#> 597       RIDEXPRG
#> 598        SIALANG
#> 599         SMQ817
#> 600        VTQ200A
#> 601         VTQ210
#> 602         WHD120
#> 603         WHD130
#> 604         WHQ150
#> 605        ACD010A
#> 606        ACD010B
#> 607        ACD010C
#> 608         ACD040
#> 609        AIALANG
#> 610         ALQ101
#> 611         ALQ110
#> 612        ALQ120Q
#> 613         ALQ130
#> 614        ALQ140Q
#> 615         ALQ150
#> 616         BHQ010
#> 617         BHQ020
#> 618         BHQ030
#> 619         BHQ040
#> 620         CBD620
#> 621         CBD625
#> 622         CBD630
#> 623         CBD635
#> 624         CBD637
#> 625         CBD640
#> 626         CBD740
#> 627         CBQ503
#> 628         CBQ503
#> 629         CBQ605
#> 630         CBQ605
#> 631         CBQ645
#> 632        CBQ695A
#> 633        CBQ695A
#> 634        CBQ695B
#> 635        CBQ695B
#> 636        CBQ695C
#> 637        CBQ695C
#> 638         CBQ700
#> 639         CBQ700
#> 640        DBQ235A
#> 641        DBQ235B
#> 642        DBQ235C
#> 643         DBQ750
#> 644         DBQ750
#> 645         DBQ780
#> 646         DBQ780
#> 647         DID070
#> 648         DID270
#> 649       DMDHRAGE
#> 650         ENQ070
#> 651        FIALANG
#> 652         FSD680
#> 653         HCQ150
#> 654       HIQ031AA
#> 655         HIQ210
#> 656         INQ020
#> 657         KIQ005
#> 658         KIQ050
#> 659         KIQ052
#> 660        MCQ240H
#> 661        MCQ300A
#> 662        MIALANG
#> 663         OCD231
#> 664         OCD391
#> 665        OPDDARM
#> 666        OPDDBCO
#> 667        OPDDBVO
#> 668        OPDDCVO
#> 669        OPDDHEM
#> 670        OPDDHMA
#> 671         OPDDMA
#> 672       OPDDPHVH
#> 673        OPDDPPS
#> 674        OPDDREA
#> 675       OPDDSUBH
#> 676        OPDSARM
#> 677        OPDSBCO
#> 678        OPDSBVO
#> 679        OPDSCVO
#> 680        OPDSHEM
#> 681        OPDSHMA
#> 682         OPDSMA
#> 683       OPDSPHVH
#> 684        OPDSPPS
#> 685        OPDSREA
#> 686       OPDSSUBH
#> 687        OPDUARM
#> 688        OPDUBCO
#> 689        OPDUBVO
#> 690        OPDUCVO
#> 691        OPDUHEM
#> 692        OPDUHMA
#> 693         OPDUMA
#> 694       OPDUPHVH
#> 695        OPDUPPS
#> 696       OPDUSUBH
#> 697       OPXDGRBL
#> 698       OPXDQUAL
#> 699       OPXDRCDR
#> 700       OPXSGRBL
#> 701       OPXSQUAL
#> 702       OPXSRCDR
#> 703        OSD110a
#> 704        OSD110b
#> 705        OSD110c
#> 706        OSD110d
#> 707        OSD110e
#> 708        OSD110f
#> 709        OSD110g
#> 710        OSD110h
#> 711         OSQ080
#> 712        OSQ120a
#> 713        OSQ120b
#> 714        OSQ120c
#> 715        OSQ120d
#> 716        OSQ120e
#> 717        OSQ120f
#> 718        OSQ120g
#> 719        OSQ120h
#> 720        OSQ120i
#> 721        OSQ120j
#> 722         PAD590
#> 723         PAD600
#> 724         PFQ015
#> 725         RDQ090
#> 726         RHQ131
#> 727         RHQ160
#> 728       RIDAGEEX
#> 729       RIDAGEMN
#> 730       RIDAGEYR
#> 731       RIDAGGRP
#> 732       RIDAGGRP
#> 733       RIDAGGRP
#> 734       RIDAGGRP
#> 735       RIDEXPRG
#> 736        SIALANG
#> 737         SMQ817
#> 738         VIQ310
#> 739         VIQ320
#> 740        VIXKLDM
#> 741        VIXKLMM
#> 742        VIXKRDM
#> 743        VIXKRMM
#> 744        VTQ200A
#> 745        VTQ200A
#> 746        VTQ200A
#> 747         VTQ210
#> 748         VTQ210
#> 749         VTQ210
#> 750         WHD120
#> 751         WHD130
#> 752         WHQ150
#> 753        ACD010A
#> 754        ACD010B
#> 755        ACD010C
#> 756         ACD040
#> 757         AGD170
#> 758        AIALANG
#> 759         ALQ101
#> 760         ALQ110
#> 761        ALQ120Q
#> 762         ALQ130
#> 763        ALQ140Q
#> 764         ALQ150
#> 765         BHQ010
#> 766         BHQ020
#> 767         BHQ030
#> 768         BHQ040
#> 769         DBD091
#> 770        DBQ235A
#> 771        DBQ235B
#> 772        DBQ235C
#> 773         DBQ780
#> 774         DID070
#> 775         DID270
#> 776       DMDHRAGE
#> 777        DSD122U
#> 778        FFQ0007
#> 779        FFQ0008
#> 780        FFQ0031
#> 781       FFQ0063B
#> 782        FFQ0064
#> 783        FFQ0067
#> 784        FFQ0077
#> 785        FFQ0086
#> 786        FFQ0090
#> 787       FFQ0090A
#> 788       FFQ0098A
#> 789        FFQ0109
#> 790        FFQ0131
#> 791        FFQ0132
#> 792        FFQ0133
#> 793        FIALANG
#> 794         HCQ150
#> 795       HIQ031AA
#> 796         HIQ210
#> 797         KIQ005
#> 798         KIQ050
#> 799         KIQ052
#> 800        MCQ240H
#> 801        MCQ300A
#> 802        MIALANG
#> 803         OCD231
#> 804        OPDDARM
#> 805        OPDDBCO
#> 806        OPDDBVO
#> 807        OPDDCVO
#> 808        OPDDHEM
#> 809        OPDDHMA
#> 810         OPDDMA
#> 811       OPDDPHVH
#> 812        OPDDPPS
#> 813        OPDDREA
#> 814       OPDDSUBH
#> 815        OPDSARM
#> 816        OPDSBCO
#> 817        OPDSBVO
#> 818        OPDSCVO
#> 819        OPDSHEM
#> 820        OPDSHMA
#> 821         OPDSMA
#> 822       OPDSPHVH
#> 823        OPDSPPS
#> 824        OPDSREA
#> 825       OPDSSUBH
#> 826        OPDUARM
#> 827        OPDUBCO
#> 828        OPDUBVO
#> 829        OPDUCVO
#> 830        OPDUHEM
#> 831        OPDUHMA
#> 832         OPDUMA
#> 833       OPDUPHVH
#> 834        OPDUPPS
#> 835       OPDUSUBH
#> 836       OPXDGRBL
#> 837       OPXDQUAL
#> 838       OPXDRCDR
#> 839       OPXSGRBL
#> 840       OPXSQUAL
#> 841       OPXSRCDR
#> 842        OSD110a
#> 843        OSD110b
#> 844        OSD110c
#> 845        OSD110d
#> 846        OSD110e
#> 847        OSD110f
#> 848        OSD110g
#> 849        OSD110h
#> 850        OSD110i
#> 851        OSD110j
#> 852         OSQ080
#> 853        OSQ120a
#> 854        OSQ120b
#> 855        OSQ120c
#> 856        OSQ120d
#> 857        OSQ120e
#> 858        OSQ120f
#> 859        OSQ120g
#> 860        OSQ120h
#> 861        OSQ120i
#> 862        OSQ120j
#> 863         PAD590
#> 864         PAD600
#> 865       PADDURAT
#> 866         PAQ520
#> 867         PFQ015
#> 868        PSQ100A
#> 869         PSQ230
#> 870         PSQ300
#> 871         RDQ090
#> 872         RHQ131
#> 873         RHQ160
#> 874       RIDAGEEX
#> 875       RIDAGEMN
#> 876       RIDAGEYR
#> 877       RIDAGGRP
#> 878       RIDAGGRP
#> 879       RIDAGGRP
#> 880       RIDAGGRP
#> 881        SIALANG
#> 882         SMD070
#> 883         SMQ817
#> 884         VIQ310
#> 885         VIQ320
#> 886        VIXKLDM
#> 887        VIXKLMM
#> 888        VIXKRDM
#> 889        VIXKRMM
#> 890        VTQ200A
#> 891         VTQ210
#> 892         VTQ210
#> 893         WHD120
#> 894         WHD130
#> 895         WHQ150
#> 896        ACD010A
#> 897        ACD010B
#> 898        ACD010C
#> 899         ACD040
#> 900         ACQ020
#> 901         ACQ030
#> 902         ACQ050
#> 903         ACQ060
#> 904        AIALANG
#> 905         ALQ101
#> 906         ALQ110
#> 907        ALQ120Q
#> 908         ALQ130
#> 909        ALQ140Q
#> 910         ALQ150
#> 911         AUQ210
#> 912         AUQ230
#> 913        CIQD110
#> 914        CIQD113
#> 915         CIQG19
#> 916         CIQG22
#> 917         CIQP17
#> 918         CIQP18
#> 919         CIQP23
#> 920         CIQP24
#> 921         CIQP29
#> 922        CVDPROT
#> 923        CVDS1DI
#> 924         CVDS1G
#> 925        CVDS1HR
#> 926         CVDS1S
#> 927        CVDS1SY
#> 928       CVDS1TIM
#> 929        CVDS2DI
#> 930         CVDS2G
#> 931        CVDS2HR
#> 932         CVDS2S
#> 933        CVDS2SY
#> 934       CVDS2TIM
#> 935        CVQ220a
#> 936        CVQ220b
#> 937        CVQ220g
#> 938       CVXS1RPE
#> 939       CVXS2RPE
#> 940         DBD090
#> 941        DBQ235A
#> 942        DBQ235B
#> 943        DBQ235C
#> 944        DEABACK
#> 945       DEABKRSN
#> 946       DEAFLRSN
#> 947       DEAFRLEG
#> 948       DEAIARSN
#> 949       DEAINARM
#> 950       DEALLRSN
#> 951       DEALOLEG
#> 952         DIQ070
#> 953       DMDHRAGE
#> 954        DSD122U
#> 955        FFQ0007
#> 956        FFQ0008
#> 957        FFQ0031
#> 958       FFQ0063B
#> 959        FFQ0064
#> 960        FFQ0067
#> 961        FFQ0077
#> 962        FFQ0086
#> 963        FFQ0090
#> 964       FFQ0090A
#> 965       FFQ0098A
#> 966        FFQ0109
#> 967        FFQ0131
#> 968        FFQ0132
#> 969        FFQ0133
#> 970        FIALANG
#> 971         HCQ150
#> 972         HIQ210
#> 973         HIQ220
#> 974         HOD170
#> 975         HOD180
#> 976         KIQ042
#> 977         KIQ050
#> 978         KIQ052
#> 979        MCQ240H
#> 980        MCQ250F
#> 981        MCQ250G
#> 982        MIALANG
#> 983         OCD230
#> 984         OCQ360
#> 985         OCQ440
#> 986         PAD590
#> 987         PAD600
#> 988       PADDURAT
#> 989         PAQ520
#> 990         PFQ015
#> 991        PSQ100A
#> 992         PSQ230
#> 993         PSQ300
#> 994         RDQ090
#> 995         RHQ131
#> 996         RHQ160
#> 997       RIDAGEEX
#> 998       RIDAGEMN
#> 999       RIDAGEYR
#> 1000       RXD331Q
#> 1001       SIALANG
#> 1002        SMD070
#> 1003        SMQ180
#> 1004        SMQ817
#> 1005       VIXKLDM
#> 1006       VIXKLMM
#> 1007       VIXKRDM
#> 1008       VIXKRMM
#> 1009        VTQ210
#> 1010        WHD120
#> 1011        WHD130
#> 1012        WHQ150
#> 1013       ACD010A
#> 1014       ACD010B
#> 1015       ACD010C
#> 1016        ACD040
#> 1017        ACQ020
#> 1018        ACQ030
#> 1019        ACQ050
#> 1020        ACQ060
#> 1021        ALD100
#> 1022        ALQ110
#> 1023       ALQ120Q
#> 1024        ALQ130
#> 1025       ALQ140Q
#> 1026        ALQ150
#> 1027        AUQ210
#> 1028        AUQ230
#> 1029        BPXDAR
#> 1030        BPXSAR
#> 1031       CIQD110
#> 1032       CIQD113
#> 1033        CIQG19
#> 1034        CIQG22
#> 1035        CIQP17
#> 1036        CIQP18
#> 1037        CIQP23
#> 1038        CIQP24
#> 1039        CIQP29
#> 1040       CVDPROT
#> 1041       CVDS1DI
#> 1042        CVDS1G
#> 1043       CVDS1HR
#> 1044        CVDS1S
#> 1045       CVDS1SY
#> 1046      CVDS1TIM
#> 1047       CVDS2DI
#> 1048        CVDS2G
#> 1049       CVDS2HR
#> 1050        CVDS2S
#> 1051       CVDS2SY
#> 1052      CVDS2TIM
#> 1053       CVQ220a
#> 1054       CVQ220b
#> 1055       CVQ220g
#> 1056      CVXS1RPE
#> 1057      CVXS2RPE
#> 1058        DBD090
#> 1059      DBD235ae
#> 1060      DBD235be
#> 1061      DBD235ce
#> 1062        DIQ070
#> 1063      DMDHRAGE
#> 1064       DSD122U
#> 1065        HCQ150
#> 1066        HIQ210
#> 1067        HIQ220
#> 1068        HOD170
#> 1069        HOD180
#> 1070        KIQ042
#> 1071        KIQ050
#> 1072        KIQ052
#> 1073       MCQ240H
#> 1074       MCQ250F
#> 1075       MCQ250G
#> 1076        MSDAPF
#> 1077        OCD230
#> 1078        OCQ360
#> 1079        OCQ440
#> 1080        PAD590
#> 1081        PAD600
#> 1082      PADDURAT
#> 1083        PAQ520
#> 1084        PFCAGE
#> 1085        PFQ015
#> 1086        RDQ090
#> 1087        RHD130
#> 1088        RHQ160
#> 1089      RIDAGEEX
#> 1090      RIDAGEMN
#> 1091      RIDAGEYR
#> 1092      RIDAGGRP
#> 1093      RIDAGGRP
#> 1094      RIDAGGRP
#> 1095       RXD331Q
#> 1096        SMD070
#> 1097        SMQ180
#> 1098        SMQ817
#> 1099       VIXKLDM
#> 1100       VIXKLMM
#> 1101       VIXKRDM
#> 1102       VIXKRMM
#> 1103        WHD120
#> 1104        WHD130
#> 1105        WHQ150
#> 1106       ACD010A
#> 1107       ACD010B
#> 1108       ACD010C
#> 1109        ACD040
#> 1110        ACQ020
#> 1111        ACQ030
#> 1112        ACQ050
#> 1113        ACQ060
#> 1114        ALD240
#> 1115        ALQ100
#> 1116        ALQ110
#> 1117       ALQ120Q
#> 1118        ALQ130
#> 1119       ALQ140Q
#> 1120        ALQ150
#> 1121        AUQ210
#> 1122        AUQ230
#> 1123        BPXDAR
#> 1124        BPXSAR
#> 1125       CIQD110
#> 1126       CIQD113
#> 1127        CIQG19
#> 1128        CIQG22
#> 1129        CIQP17
#> 1130        CIQP18
#> 1131        CIQP23
#> 1132        CIQP24
#> 1133        CIQP29
#> 1134       CVDPROT
#> 1135       CVDS1DI
#> 1136        CVDS1G
#> 1137       CVDS1HR
#> 1138        CVDS1S
#> 1139       CVDS1SY
#> 1140      CVDS1TIM
#> 1141       CVDS2DI
#> 1142        CVDS2G
#> 1143       CVDS2HR
#> 1144        CVDS2S
#> 1145       CVDS2SY
#> 1146      CVDS2TIM
#> 1147       CVQ220a
#> 1148       CVQ220b
#> 1149       CVQ220g
#> 1150      CVXS1RPE
#> 1151      CVXS2RPE
#> 1152        DBD090
#> 1153       DBD235a
#> 1154       DBD235b
#> 1155       DBD235c
#> 1156       DBD270a
#> 1157       DBD270b
#> 1158       DBD270c
#> 1159       DBD270d
#> 1160       DBD270e
#> 1161        DIQ070
#> 1162      DMDHRAGE
#> 1163       DSD120U
#> 1164        HIQ210
#> 1165        HIQ220
#> 1166        HOD170
#> 1167        HOD180
#> 1168       MCQ240H
#> 1169       MCQ250F
#> 1170       MCQ250G
#> 1171        MSDAPF
#> 1172        OCD230
#> 1173        OCQ130
#> 1174        OCQ360
#> 1175        OCQ440
#> 1176      PADDURAT
#> 1177        PAQ520
#> 1178        PFQ015
#> 1179        RDQ090
#> 1180        RHD130
#> 1181        RHQ160
#> 1182      RIDAGEEX
#> 1183      RIDAGEMN
#> 1184      RIDAGEYR
#> 1185       RXD331Q
#> 1186        SMD070
#> 1187        SMQ180
#> 1188        SMQ817
#> 1189       VIXKLDM
#> 1190       VIXKLMM
#> 1191       VIXKRDM
#> 1192       VIXKRMM
#> 1193        VTQ030
#> 1194        VTQ080
#> 1195        WHD120
#> 1196        WHD120
#> 1197        WHD130
#> 1198        WHD130
#> 1199        WHD150
#> 1200        WHD170
#> 1201        WHQ150
#>                                                                                                                    Variable.Description
#> 1                                                                              What language(s) {do you/does SP} usually speak at home?
#> 2                                                                              What language(s) {do you/does SP} usually speak at home?
#> 3                                                                              What language(s) {do you/does SP} usually speak at home?
#> 4     Now I'm going to ask you about language use.\nWhat language(s) {do you/does SP} usually speak at home?  {Do you/Does he/Does she}
#> 5     During the past 12 months, about how often did you drink any type of alcoholic beverage?\nPROBE: In other words, how many days pe
#> 6      During the past 12 months, on those days that you drank alcoholic beverages, on average, how many drinks did you have? (By a dri
#> 7      During the past 12 months, about how often did you have {DISPLAY NUMBER} or more drinks of any alcoholic beverage? PROBE: In oth
#> 8      Was there ever a time or times in your life when you drank {DISPLAY NUMBER} or more drinks of any kind of alcoholic beverage alm
#> 9      Considering all types of alcoholic beverages, during the past 30 days, how many times did you have {DISPLAY NUMBER} or more drin
#> 10     {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 11                                                                                                         HH ref person’s age in years
#> 12                                                                Total number of foods/beverages reported in the individual foods file
#> 13                                                                Total number of foods/beverages reported in the individual foods file
#> 14     Please look at card FNQ1, again. Compared with children of the same age, {do you/does SP} have difficulty walking 100 yards/mete
#> 15     Compared with children of the same age, {do you/does SP} have difficulty learning things? [Would you say {you have/SP has}: no d
#> 16     Compared with children of the same age, {do you/does SP} have difficulty controlling {your/his/her/SP's} behavior? [Would you sa
#> 17     Compared with children of the same age, {do you/does SP} have difficulty remembering things? [Would you say {you have/SP has}: n
#> 18     Using {your/his/her/SP's} usual language, {do you/does SP} have difficulty communicating, for example, understanding or being un
#> 19                                  In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 20            The next few questions ask about urine leakage. Many people have leakage of urine. How often do you have urinary leakage?
#> 21                                     During the past 12 months, how much did your leakage of urine affect your day-to-day activities?
#> 22     The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 23     Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (o
#> 24                  Age in years of the participant at the time of screening. Individuals 80 and over are top-coded at 80 years of age.
#> 25     Age in months of the participant at the time of examination. Reported for persons aged 19 years or younger at the time of examin
#> 26                                                 Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 27     Not counting decks, porches, or detached garages, how many people who live here smoke cigarettes, cigars, little cigars, pipes, 
#> 28                                                                             What language(s) {do you/does SP} usually speak at home?
#> 29                                                                             What language(s) {do you/does SP} usually speak at home?
#> 30                                                                             What language(s) {do you/does SP} usually speak at home?
#> 31                                                                             What language(s) {do you/does SP} usually speak at home?
#> 32                                                                             What language(s) {do you/does SP} usually speak at home?
#> 33                                                                             What language(s) {do you/does SP} usually speak at home?
#> 34    Now I'm going to ask you about language use.\nWhat language(s) {do you/does SP} usually speak at home?  {Do you/Does he/Does she}
#> 35    Now I'm going to ask you about language use.\nWhat language(s) {do you/does SP} usually speak at home?  {Do you/Does he/Does she}
#> 36     {Do you/Does SP} speak only (NON-ENGLISH LANGUAGE), more (NON-ENGLISH LANGUAGE) than English, both equally, more English than (N
#> 37     {Do you/Does SP} speak only (NON-ENGLISH LANGUAGE), more (NON-ENGLISH LANGUAGE) than English, both equally, more English than (N
#> 38                                                                                       Language of the MEC ACASI Interview Instrument
#> 39                                                                                       Language of the MEC ACASI Interview Instrument
#> 40     The next questions are about drinking alcoholic beverages. Included are liquor (such as whiskey or gin), beer, wine, wine cooler
#> 41     The next questions are about drinking alcoholic beverages. Included are liquor (such as whiskey or gin), beer, wine, wine cooler
#> 42    During the past 12 months, about how often did {you/SP} drink any type of alcoholic beverage?\nPROBE: How many days per week, per
#> 43    During the past 12 months, about how often did {you/SP} drink any type of alcoholic beverage?\nPROBE: How many days per week, per
#> 44     During the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/sh
#> 45     During the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/sh
#> 46    During the past 12 months, about how often did {you/SP} have {DISPLAY NUMBER} or more drinks of any alcoholic beverage?\nPROBE: H
#> 47    During the past 12 months, about how often did {you/SP} have {DISPLAY NUMBER} or more drinks of any alcoholic beverage?\nPROBE: H
#> 48     Was there ever a time or times in {your/SP's} life when {you/he/she} drank {DISPLAY NUMBER} or more drinks of any kind of alcoho
#> 49     Was there ever a time or times in {your/SP's} life when {you/he/she} drank {DISPLAY NUMBER} or more drinks of any kind of alcoho
#> 50     Considering all types of alcoholic beverages, during the past 30 days, how many times did you have {5/4} or more drinks on an oc
#> 51     Considering all types of alcoholic beverages, during the past 30 days, how many times did you have {5/4} or more drinks on an oc
#> 52     In the past 2 weeks, how often {have you/has SP} worn a {hearing aid and/or personal sound amplifier and/or cochlear implant}? I
#> 53     In the past 2 weeks, how often {have you/has SP} worn a {hearing aid and/or personal sound amplifier and/or cochlear implant}? I
#> 54     Because of hearing loss, {have you/has SP} ever used any of the following to improve {your/his/her} communication: FM systems, c
#> 55     Because of hearing loss, {have you/has SP} ever used any of the following to improve {your/his/her} communication: FM systems, c
#> 56     Has SP ever received Special Education or Early Intervention Services for speech-language, reading, hearing or listening skills,
#> 57     Has SP ever received Special Education or Early Intervention Services for speech-language, reading, hearing or listening skills,
#> 58     The next questions are about how much money {your family spends/you spend} on food. First I'll ask you about money spent at supe
#> 59     Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 60     Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 61     Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 62     Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 63     I am going to ask you about eating foods and beverages from different places. The types of places are listed on hand card 1 in y
#> 64     I am going to ask you about eating foods and beverages from different places. The types of places are listed on hand card 1 in y
#> 65     I am going to ask you about eating foods and beverages from different places. The types of places are listed on hand card 1 in y
#> 66     I am going to ask you about eating foods and beverages from different places. The types of places are listed on hand card 1 in y
#> 67              At the last fast food or pizza place you bought foods or beverages, did you notice any calorie information on the menu?
#> 68              At the last fast food or pizza place you bought foods or beverages, did you notice any calorie information on the menu?
#> 69              At the last fast food or pizza place you bought foods or beverages, did you notice any calorie information on the menu?
#> 70              At the last fast food or pizza place you bought foods or beverages, did you notice any calorie information on the menu?
#> 71     {Please turn to hand card 2.} About how many calories do you think a {man/woman} of your age and physical activity needs to cons
#> 72     {Please turn to hand card 2.} About how many calories do you think a {man/woman} of your age and physical activity needs to cons
#> 73     {Now turn the page to use hand card 3.} Many food packages contain an expiration date such as "use by" or "sell by". How often d
#> 74     {Now turn the page to use hand card 3.} Many food packages contain an expiration date such as "use by" or "sell by". How often d
#> 75     {Now turn the page to use hand card 3.} Many food packages contain an expiration date such as "use by" or "sell by". How often d
#> 76     {Now turn the page to use hand card 3.} Many food packages contain an expiration date such as "use by" or "sell by". How often d
#> 77     In the past 12 months, did you buy any foods or beverages at a place that sells mostly beverages such as a coffee shop or juice 
#> 78     In the past 12 months, did you buy any foods or beverages at a place that sells mostly beverages such as a coffee shop or juice 
#> 79     In the past 12 months, did you buy any foods or beverages at a place that sells mostly beverages such as a coffee shop or juice 
#> 80     In the past 12 months, did you buy any foods or beverages at a place that sells mostly beverages such as a coffee shop or juice 
#> 81     The last time you bought foods or beverages at a place that sells mostly beverages, did you notice any calorie information on th
#> 82     The last time you bought foods or beverages at a place that sells mostly beverages, did you notice any calorie information on th
#> 83     The last time you bought foods or beverages at a place that sells mostly beverages, did you notice any calorie information on th
#> 84     The last time you bought foods or beverages at a place that sells mostly beverages, did you notice any calorie information on th
#> 85           In the past 12 months, did you buy any foods or beverages at movie theaters, sports arenas, or other places of recreation?
#> 86           In the past 12 months, did you buy any foods or beverages at movie theaters, sports arenas, or other places of recreation?
#> 87           In the past 12 months, did you buy any foods or beverages at movie theaters, sports arenas, or other places of recreation?
#> 88           In the past 12 months, did you buy any foods or beverages at movie theaters, sports arenas, or other places of recreation?
#> 89     The last time you bought foods or beverages at a movie theater, sports arena, or other place of recreation, did you notice any c
#> 90     The last time you bought foods or beverages at a movie theater, sports arena, or other place of recreation, did you notice any c
#> 91     The last time you bought foods or beverages at a movie theater, sports arena, or other place of recreation, did you notice any c
#> 92     The last time you bought foods or beverages at a movie theater, sports arena, or other place of recreation, did you notice any c
#> 93     {Please turn to hand cards 12 and 13.}  How about the information on the number of servings in the package?  [How often do you u
#> 94     {Please turn to hand cards 12 and 13.}  How about the information on the number of servings in the package?  [How often do you u
#> 95     {Please turn to hand cards 12 and 13.}  How about the information on the number of servings in the package?  [How often do you u
#> 96     {Please turn to hand cards 12 and 13.}  How about the information on the number of servings in the package?  [How often do you u
#> 97     {Please turn your hand cards to the next page.}  How about information on sugars?  [How often do you use information on sugars o
#> 98     {Please turn your hand cards to the next page.}  How about information on sugars?  [How often do you use information on sugars o
#> 99     {Please turn your hand cards to the next page.}  How about information on sugars?  [How often do you use information on sugars o
#> 100    {Please turn your hand cards to the next page.}  How about information on sugars?  [How often do you use information on sugars o
#> 101    {Please turn to the next hand card page.}  Some food packages contain two column labels. {For example, the one shown in hand car
#> 102    {Please turn to the next hand card page.}  Some food packages contain two column labels. {For example, the one shown in hand car
#> 103    {Please turn to the next hand card page.}  Some food packages contain two column labels. {For example, the one shown in hand car
#> 104    {Please turn to the next hand card page.}  Some food packages contain two column labels. {For example, the one shown in hand car
#> 105    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 106    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 107    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 108    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 109    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 110    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 111    {Please turn your hand card to the next page.} How about the information on the serving size? [HAND CARD # 10] How often do you 
#> 112    {Please turn your hand card to the next page.} How about the information on the serving size? [HAND CARD # 10] How often do you 
#> 113    {Please turn your hand card to the next page.} How about the information on the serving size? [HAND CARD # 10] How often do you 
#> 114    {Please turn your hand card to the next page.} How about the information on the serving size? [HAND CARD # 10] How often do you 
#> 115    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 4}. How often 
#> 116    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 4}. How often 
#> 117    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 4}. How often 
#> 118    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 4}. How often 
#> 119    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 120    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 121    Glycosylated (GLY-KOH-SIH-LAY-TED) hemoglobin or the "A one C" test measures your average level of blood sugar for the past 3 mo
#> 122    Glycosylated (GLY-KOH-SIH-LAY-TED) hemoglobin or the "A one C" test measures your average level of blood sugar for the past 3 mo
#> 123                                                                         Number of children aged 5 years or younger in the household
#> 124                                                                             Number of children aged 6-17 years old in the household
#> 125                                                                            Number of adults aged 60 years or older in the household
#> 126                                                                                                  HH reference person's age in years
#> 127                                                               Total number of foods/beverages reported in the individual foods file
#> 128                                                               Total number of foods/beverages reported in the individual foods file
#> 129                                                               Total number of foods/beverages reported in the individual foods file
#> 130                                                               Total number of foods/beverages reported in the individual foods file
#> 131                                                                                         Language of the Family Interview Instrument
#> 132                                                                                         Language of the Family Interview Instrument
#> 133    During {this/your last} pregnancy did you use WIC benefits to buy food for yourself? {Please include any stillbirth or miscarria
#> 134    During {this/your last} pregnancy did you use WIC benefits to buy food for yourself? {Please include any stillbirth or miscarria
#> 135    Did {SP} receive benefits from WIC when {he/she} {was/is} between the ages of {1 to {SP AGE/4} years old/12 to {SP AGE} months o
#> 136    Did {SP} receive benefits from WIC when {he/she} {was/is} between the ages of {1 to {SP AGE/4} years old/12 to {SP AGE} months o
#> 137    Did {you/you or anyone who lives here} receive WIC benefits in the past 30 days? {Here is the list of children 5 years and young
#> 138    Did {you/you or anyone who lives here} receive WIC benefits in the past 30 days? {Here is the list of children 5 years and young
#> 139                                                                                                            No coverage of any type.
#> 140                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 141                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 142    The next questions are about {your/your combined family} income.  When answering these questions, please remember that by {"inco
#> 143    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 144    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 145    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 146    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 147    During the past 12 months, how much did {your/her/his} leakage of urine affect {your/her/his} day-to-day activities?  Please sel
#> 148    During the past 12 months, how much did {your/her/his} leakage of urine affect {your/her/his} day-to-day activities?  Please sel
#> 149    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 150    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 151                                                                                       Language of the MEC CAPI Interview Instrument
#> 152                                                                                       Language of the MEC CAPI Interview Instrument
#> 153    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 154    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 155    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 156    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 157    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 158    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 159                                                                                        At what age did {SP} start using toothpaste?
#> 160                                                                                        At what age did {SP} start using toothpaste?
#> 161                                                                                        At what age did {SP} start using toothpaste?
#> 162                                                                                        At what age did {SP} start using toothpaste?
#> 163                                                                                        At what age did {SP} start using toothpaste?
#> 164                                                                                        At what age did {SP} start using toothpaste?
#> 165                                            On average, how much toothpaste {do you/does SP} use when brushing {your/his/her} teeth?
#> 166                                            On average, how much toothpaste {do you/does SP} use when brushing {your/his/her} teeth?
#> 167    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100a) for the first time after ag
#> 168    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100a) for the first time after ag
#> 169    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100b) for the first time after ag
#> 170    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100b) for the first time after ag
#> 171    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100c) for the first time after ag
#> 172    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100c) for the first time after ag
#> 173    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100d) for the first time after ag
#> 174    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100d) for the first time after ag
#> 175    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100e) for the first time after ag
#> 176    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100e) for the first time after ag
#> 177    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in 05OSQ.100) for the first time after 
#> 178    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in 05OSQ.100) for the first time after 
#> 179    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ.100) for the first time after ag
#> 180    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ.100) for the first time after ag
#> 181    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bone after {you were/s/he was} 20 years of age
#> 182    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bone after {you were/s/he was} 20 years of age
#> 183    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 184    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 185    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 186    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 187    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 188    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 189    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 190    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 191    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 192    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 193    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 194    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 195    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 196    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 197    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 198    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 199    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 200    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 201    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 202    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 203    Now I will ask you first about TV watching and then about computer use. Over the past 30 days, on average how many hours per day
#> 204    Text: Over the past 30 days, on average how many hours per day did {you/SP} use a computer or play computer games outside of sch
#> 205    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 206    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 207    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 208    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 209    Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (o
#> 210    Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (o
#> 211                  Age in years of the participant at the time of screening. Individuals 80 and over are topcoded at 80 years of age.
#> 212                  Age in years of the participant at the time of screening. Individuals 80 and over are topcoded at 80 years of age.
#> 213    Age in months of the participant at the time of examination. Reported for persons aged 19 years or younger at the time of examin
#> 214                                                Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 215                                                Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 216                                                                                  Language of the Sample Person Interview Instrument
#> 217                                                                                  Language of the Sample Person Interview Instrument
#> 218    Not counting decks, porches, or detached garages, how many people who live here smoke cigarettes, cigars, little cigars, pipes, 
#> 219    Not counting decks, porches, or detached garages, how many people who live here smoke cigarettes, cigars, little cigars, pipes, 
#> 220    (Not counting decks, porches, or detached garages) During the past 7 days, that is since last [TODAY'S DAY OF WEEK], on how many
#> 221    During the past 5 days, including today, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhage
#> 222    During the past 5 days, including today, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhage
#> 223    {Do you/Does she/Does he} currently store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and atta
#> 224    {Do you/Does she/Does he} currently store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and atta
#> 225          First,  I would like to ask you a few questions about {your/SP's} home.  Does {your/her/his} home have an attached garage?
#> 226          First,  I would like to ask you a few questions about {your/SP's} home.  Does {your/her/his} home have an attached garage?
#> 227    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 228    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 229                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 230                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 231                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 232                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 233                                                                            What language(s) {do you/does SP} usually speak at home?
#> 234                                                                            What language(s) {do you/does SP} usually speak at home?
#> 235                                                                            What language(s) {do you/does SP} usually speak at home?
#> 236   Now I'm going to ask you about language use.\nWhat language(s) {do you/does SP} usually speak at home?  {Do you/Does he/Does she}
#> 237    {Do you/Does SP} speak only (NON-ENGLISH LANGUAGE), more (NON-ENGLISH LANGUAGE) than English, both equally, more English than (N
#> 238                                                                                      Language of the MEC ACASI Interview Instrument
#> 239    In any one year, {have you/has SP} had at least 12 drinks of any type of alcoholic beverage? By a drink, I mean a 12 oz. beer, a
#> 240                     In {your/SP's} entire life, {have you/has he/has she} had at least 12 drinks of any type of alcoholic beverage?
#> 241    In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 242    In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 243    In the past 12 months, on how many days did {you/SP} have {Display number} or more drinks of any alcoholic beverage? PROBE: How 
#> 244    Was there ever a time or times in {your/SP's} life when {you/he/she} drank {DISPLAY NUMBER} or more drinks of any kind of alcoho
#> 245    {Have you/Has SP} ever used assistive listening devices (ALDs), such as FM systems, closed-captioned television, amplified telep
#> 246                                                                                            Average Sagittal Abdominal Diameter (cm)
#> 247    The next questions are about how much money {your family spends/you spend} on food. First I'll ask you about money spent at supe
#> 248    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 249    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 250    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 251    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 252    Glycosylated (GLY-KOH-SIH-LAY-TED) hemoglobin or the "A one C" test measures your average level of blood sugar for the past 3 mo
#> 253                                                                         Number of children aged 5 years or younger in the household
#> 254                                                                             Number of children aged 6-17 years old in the household
#> 255                                                                            Number of adults aged 60 years or older in the household
#> 256                                                                                                  HH reference person's age in years
#> 257                                                               Total number of foods/beverages reported in the individual foods file
#> 258                                                               Total number of foods/beverages reported in the individual foods file
#> 259                                                                                         Language of the Family Interview Instrument
#> 260    During {this/your last} pregnancy did you use WIC benefits to buy food for yourself? {Please include any stillbirth or miscarria
#> 261    Did {SP} receive benefits from WIC when {he/she} {was/is} between the ages of {1 to {SP AGE/4} years old/12 to {SP AGE} months o
#> 262    Did {you/you or anyone who lives here} receive WIC benefits in the past 30 days? {Here is the list of children 5 years and young
#> 263                                                                                                            No coverage of any type.
#> 264                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 265    The next questions are about {your/your combined family} income.  When answering these questions, please remember that by {"inco
#> 266    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 267    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 268    During the past 12 months, how much did {your/her/his} leakage of urine affect {your/her/his} day-to-day activities?  Please sel
#> 269                                                                                          Fluoride, plasma (umol/L) average 2 values
#> 270                                                                                             Fluoride, water (mg/L) average 2 values
#> 271                                                               How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 272    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 273                                                                                       Language of the MEC CAPI Interview Instrument
#> 274    On average, during days when {you are/SP is} exposed to this loud noise, for how many hours per day {have you/has SP} been expos
#> 275    On average, during days when {you are/SP is} exposed to this very loud noise, for how many hours per day {have you/has he/has sh
#> 276    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 277    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 278    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 279                                                                                        At what age did {SP} start using toothpaste?
#> 280                                                                                        At what age did {SP} start using toothpaste?
#> 281                                                                                        At what age did {SP} start using toothpaste?
#> 282                                            On average, how much toothpaste {do you/does SP} use when brushing {your/his/her} teeth?
#> 283                                                                On average, for how long did {you/SP} play these active video games?
#> 284    Now I will ask you first about TV watching and then about computer use.  Over the past 30 days, on average how many hours per da
#> 285    Over the past 30 days, on average how many hours per day did {you/SP} use a computer or play computer games outside of school? I
#> 286                                                                                        On average, how long is the PE or gym class?
#> 287                                                                                          On average, how long is the recess period?
#> 288    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 289    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 290    Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (o
#> 291                  Age in years of the participant at the time of screening. Individuals 80 and over are topcoded at 80 years of age.
#> 292                                                                                                                           Age group
#> 293                                                                                                                           Age group
#> 294                                                                                                                           Age group
#> 295                                                                                               Age at Screening Adjudicated - Recode
#> 296    Age in months of the participant at the time of examination. Reported for persons aged 19 years or younger at the time of examin
#> 297                                                Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 298                                                                                  Language of the Sample Person Interview Instrument
#> 299    Not counting decks, porches, or detached garages, how many people who live here smoke cigarettes, cigars, little cigars, pipes, 
#> 300    (Not counting decks, porches, or detached garages) During the past 7 days, that is since last [TODAY'S DAY OF WEEK], on how many
#> 301    During the past 5 days, including today, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhage
#> 302    {Do you/Does she/Does he} currently store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and atta
#> 303          First,  I would like to ask you a few questions about {your/SP's} home.  Does {your/her/his} home have an attached garage?
#> 304    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 305                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 306                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 307                                                                            What language(s) {do you/does SP} usually speak at home?
#> 308                                                                            What language(s) {do you/does SP} usually speak at home?
#> 309                                                                            What language(s) {do you/does SP} usually speak at home?
#> 310   Now I'm going to ask you about language use.\nWhat language(s) {do you/does SP} usually speak at home?  {Do you/Does he/Does she}
#> 311    {Do you/Does SP} speak only (NON-ENGLISH LANGUAGE), more (NON-ENGLISH LANGUAGE) than English, both equally, more English than (N
#> 312                                                                                      Language of the MEC ACASI Interview Instrument
#> 313    The next questions are about drinking alcoholic beverages.  Included are liquor (such as whiskey or gin), beer, wine, wine coole
#> 314                    In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 315    In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 316    In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 317    In the past 12 months, on how many days did {you/SP} have {DISPLAY NUMBER} or more drinks of any alcoholic beverage? PROBE:  How
#> 318    Was there ever a time or times in {your/SP's} life when {you/he/she} drank {DISPLAY NUMBER} or more drinks of any kind of alcoho
#> 319                                                                                            Average Sagittal Abdominal Diameter (cm)
#> 320                                                                                                    Language - Cognitive Functioning
#> 321    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 322    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 323    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 324    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 325    Glycosylated (GLY-KOH-SIH-LAY-TED) hemoglobin or the "A one C" test measures your average level of blood sugar for the past 3 mo
#> 326                                                                         Number of children aged 5 years or younger in the household
#> 327                                                                             Number of children aged 6-17 years old in the household
#> 328                                                                            Number of adults aged 60 years or older in the household
#> 329                                                                                                  HH reference person's age in years
#> 330                                                               Total number of foods/beverages reported in the individual foods file
#> 331                                                               Total number of foods/beverages reported in the individual foods file
#> 332                                                                                                   Percentage of biconcave deformity
#> 333                                                                                                   Percentage of biconcave deformity
#> 334                                                                                                   Percentage of biconcave deformity
#> 335                                                                                                   Percentage of biconcave deformity
#> 336                                                                                                   Percentage of biconcave deformity
#> 337                                                                                                   Percentage of biconcave deformity
#> 338                                                                                                   Percentage of biconcave deformity
#> 339                                                                                                   Percentage of biconcave deformity
#> 340                                                                                                   Percentage of biconcave deformity
#> 341                                                                                                   Percentage of biconcave deformity
#> 342                                                                                                   Percentage of biconcave deformity
#> 343                                                                                                   Percentage of biconcave deformity
#> 344                                                                                                   Percentage of biconcave deformity
#> 345                                                                                                  Percentage of UCSF crush deformity
#> 346                                                                                                  Percentage of UCSF crush deformity
#> 347                                                                                                  Percentage of UCSF crush deformity
#> 348                                                                                                  Percentage of UCSF crush deformity
#> 349                                                                                                  Percentage of UCSF crush deformity
#> 350                                                                                                  Percentage of UCSF crush deformity
#> 351                                                                                                  Percentage of UCSF crush deformity
#> 352                                                                                                  Percentage of UCSF crush deformity
#> 353                                                                                                  Percentage of UCSF crush deformity
#> 354                                                                                                  Percentage of UCSF crush deformity
#> 355                                                                                                  Percentage of UCSF crush deformity
#> 356                                                                                                  Percentage of UCSF crush deformity
#> 357                                                                                                  Percentage of UCSF crush deformity
#> 358                                                                                        Previous self-reported fracture after age 20
#> 359                                                                                                       Percentage of wedge deformity
#> 360                                                                                                       Percentage of wedge deformity
#> 361                                                                                                       Percentage of wedge deformity
#> 362                                                                                                       Percentage of wedge deformity
#> 363                                                                                                       Percentage of wedge deformity
#> 364                                                                                                       Percentage of wedge deformity
#> 365                                                                                                       Percentage of wedge deformity
#> 366                                                                                                       Percentage of wedge deformity
#> 367                                                                                                       Percentage of wedge deformity
#> 368                                                                                                       Percentage of wedge deformity
#> 369                                                                                                       Percentage of wedge deformity
#> 370                                                                                                       Percentage of wedge deformity
#> 371                                                                                                       Percentage of wedge deformity
#> 372                                                                                         Language of the Family Interview Instrument
#> 373                              Did {SP} receive benefits from WIC when {he/she} {was/is} between the ages of 1 to {SP AGE} years old?
#> 374                                                                                                            No coverage of any type.
#> 375                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 376    The next questions are about {your/your combined family} income.  When answering these questions, please remember that by {"inco
#> 377    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 378    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 379    During the past 12 months, how much did {your/her/his} leakage of urine affect {your/her/his} day-to-day activities?  Please sel
#> 380                                                                                          Fluoride, plasma (umol/L) average 2 values
#> 381                                                                                             Fluoride, water (mg/L) average 2 values
#> 382                                                               How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 383    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 384                                                                                       Language of the MEC CAPI Interview Instrument
#> 385    What kind of business or industry is this? (For example: a TV or, radio management, retail shoe store, state labor department, f
#> 386    What kind of business or industry is this? (For example: a TV or, radio management, retail shoe store, state labor department, f
#> 387    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 388    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 389    We would like you to think of the time when {SP} started brushing {his/her} teeth either with your help or alone. At what age di
#> 390                                                                                        At what age did {SP} start using toothpaste?
#> 391                                                                                        At what age did {SP} start using toothpaste?
#> 392                                                                                        At what age did {SP} start using toothpaste?
#> 393                                            On average, how much toothpaste {do you/does SP} use when brushing {your/his/her} teeth?
#> 394    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100a) for the first time after ag
#> 395    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100b) for the first time after ag
#> 396    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100c) for the first time after ag
#> 397    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100d) for the first time after ag
#> 398    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100e) for the first time after ag
#> 399    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100d) for the first time after ag
#> 400    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bone after {you were/s/he was} 20 years of age
#> 401    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 402    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 403    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 404    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 405    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 406    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 407    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 408    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 409                                                                On average, for how long did {you/SP} play these active video games?
#> 410    Now I will ask you first about TV watching and then about computer use.  Over the past 30 days, on average how many hours per da
#> 411    Over the past 30 days, on average how many hours per day did {you/SP} use a computer or play computer games outside of school? I
#> 412                                                                                        On average, how long is the PE or gym class?
#> 413                                                                                          On average, how long is the recess period?
#> 414    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 415    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 416    Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (o
#> 417                  Age in years of the participant at the time of screening. Individuals 80 and over are topcoded at 80 years of age.
#> 418                                                                                                                           Age group
#> 419                                                                                                                           Age group
#> 420                                                                                                                           Age group
#> 421                                                                                               Age at Screening Adjudicated - Recode
#> 422    Age in months of the participant at the time of examination. Reported for persons aged 19 years or younger at the time of examin
#> 423                                                Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 424                                                                                  Language of the Sample Person Interview Instrument
#> 425    Not counting decks, porches, or detached garages, how many people who live here smoke cigarettes, cigars, little cigars, pipes, 
#> 426    (Not counting decks, porches, or detached garages) During the past 7 days, that is since last [TODAY'S DAY OF WEEK], on how many
#> 427    During the past 5 days, including today, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhage
#> 428                                 Do you currently store paints or fuels inside your home? Include your basement and attached garage.
#> 429    {Do you/Does she/Does he} currently store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and atta
#> 430                                                                                             Does your home have an attached garage?
#> 431          First,  I would like to ask you a few questions about {your/SP's} home.  Does {your/her/his} home have an attached garage?
#> 432    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 433                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 434                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 435                                                                            What language(s) {do you/does SP} usually speak at home?
#> 436                                                                            What language(s) {do you/does SP} usually speak at home?
#> 437                                                                            What language(s) {do you/does SP} usually speak at home?
#> 438   Now I'm going to ask you about language use.\nWhat language(s) {do you/does SP} usually speak at home?  {Do you/Does he/Does she}
#> 439    {Do you/Does SP} speak only (NON-ENGLISH LANGUAGE), more (NON-ENGLISH LANGUAGE) than English, both equally, more English than (N
#> 440                                                                                      Language of the MEC ACASI Interview Instrument
#> 441    The next questions are about drinking alcoholic beverages.  Included are liquor (such as whiskey or gin), beer, wine, wine coole
#> 442                    In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 443    In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 444    In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 445    In the past 12 months, on how many days did {you/SP} have {DISPLAY NUMBER} or more drinks of any alcoholic beverage? PROBE:  How
#> 446    Was there ever a time or times in {your/SP's} life when {you/he/she} drank {DISPLAY NUMBER} or more drinks of any kind of alcoho
#> 447     For about how many years did {you/SP} drink {DISPLAY NUMBER} or more drinks of any kind of alcoholic beverage almost every day?
#> 448    {Have you/Has SP} ever used assistive listening devices (ALDs), such as FM systems, closed-captioned television, amplified telep
#> 449                        {Have you/Has SP} looked up the My Pyramid plan for a {man/woman/person} {your/his/her} age on the internet?
#> 450                                                                                                    Language - Cognitive Functioning
#> 451    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 452    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 453    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 454    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 455    Glycosylated (GLY-CO-SYL-AT-ED) hemoglobin or the "A one C" test measures your average level of blood sugar for the past 3 month
#> 456                                                                         Number of children aged 5 years or younger in the household
#> 457                                                                             Number of children aged 6-17 years old in the household
#> 458                                                                            Number of adults aged 60 years or older in the household
#> 459                                                                                                  HH reference person's age in years
#> 460                          Within the last three hours have you eaten beets, broccoli, cabbage, celery, lettuce, spinach or radishes?
#> 461                                                                                         Language of the Family Interview Instrument
#> 462                              Did {SP} receive benefits from WIC when {he/she} {was/is} between the ages of 1 to {SP AGE} years old?
#> 463    Did (your/SP's) doctor or health professional tell (you/him/her) to avoid or limit alcoholic beverages (in the future) because o
#> 464                                                                                                            No coverage of any type.
#> 465                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 466    The next questions are about {your/your combined family} income.  When answering these questions, please remember that by {"inco
#> 467    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 468    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 469    During the past 12 months, how much did {your/her/his} leakage of urine affect {your/her/his} day-to-day activities?  Please sel
#> 470                                                               How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 471    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 472                                                                                       Language of the MEC CAPI Interview Instrument
#> 473    What kind of business or industry is this? (For example: TV and radio management, retail shoe store, state labor department, far
#> 474    What kind of business or industry is this? (For example: TV and radio management, retail shoe store, state labor department, far
#> 475    Now I will ask you first about TV watching and then about computer use.  Over the past 30 days, on average how many hours per da
#> 476    Over the past 30 days, on average how many hours per day did {you/SP} use a computer or play computer games outside of work or s
#> 477    [In the past 12 months], how often, on average, has {your/SP's} sleep been disturbed because of wheezing?  Would you say this ha
#> 478    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 479    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 480    Age in months of the participant at the time of screening. Reported for persons aged 24 months or younger at the time of exam (o
#> 481                  Age in years of the participant at the time of screening. Individuals 80 and over are topcoded at 80 years of age.
#> 482                                                                                                                           Age group
#> 483                                                                                                                           Age group
#> 484                                                                                                                           Age group
#> 485                                                                                               Age at Screening Adjudicated - Recode
#> 486    Age in months of the participant at the time of examination. Reported for persons aged 19 years or younger at the time of examin
#> 487          Age in years of the participant at the time of examination. Reported for persons aged 2-19 years at the time of screening.
#> 488                                                Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 489                                                                                  Language of the Sample Person Interview Instrument
#> 490    During the past 5 days {including today}, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhag
#> 491    {Do you/Does she/Does he} store paints or fuels inside {your/her/his} home? Include {your/her/his} basement {and attached garage
#> 492            First, I would like to ask you a few questions about {your/SP's} home. Does {your/her/his} home have an attached garage?
#> 493    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 494                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 495                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 496                                                                            What language(s) {do you/does SP} usually speak at home?
#> 497                                                                            What language(s) {do you/does SP} usually speak at home?
#> 498                                                                            What language(s) {do you/does SP} usually speak at home?
#> 499                               Now I'm going to ask you about language use. What language(s) {do you/does SP} usually speak at home?
#> 500                                                                                      Language of the MEC ACASI Interview Instrument
#> 501    The next questions are about drinking alcoholic beverages.  Included are liquor (such as whiskey or gin), beer, wine, wine coole
#> 502                    In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 503    In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 504    In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 505    In the past 12 months, on how many days did {you/SP} have 5 or more drinks of any alcoholic beverage? PROBE: How many days per w
#> 506    Was there ever a time or times in {your/SP's} life when {you/he/she} drank 5 or more drinks of any kind of alcoholic beverage al
#> 507                                                How often did {you/SP} get RIB CAGE pain, aching or stiffness? Did {you/SP} have it…
#> 508                                                                                  Pain Diagram Area 7: Sternum and Anterior Rib Cage
#> 509    Next we are going to ask you a series of questions about the location{s} you just mentioned. Which specifically did {you/SP} hav
#> 510    Next we are going to ask you a series of questions about the location{s} you just mentioned. Which specifically did {you/SP} hav
#> 511    Next we are going to ask you a series of questions about the location{s} you just mentioned. Which specifically did {you/SP} hav
#> 512                                                                        Do {you/SP} still have RIB CAGE pain, aching or stiffness?\n
#> 513                                           How old {were you/was SP} when {you/s/he} first had RIB CAGE pain, aching or stiffness?\n
#> 514                                                                  When did {you/s/he} last have RIB CAGE pain, aching, or stiffness?
#> 515                                           How old {were you/was SP} when {you/s/he} last had RIB CAGE pain, aching, or stiffness?\n
#> 516    Was there one time when {you/SP} had pain, aching or stiffness in {your/his/her} RIB CAGE on almost every day for 3 or more mont
#> 517                               How long did it take for {your/SP's} RIB CAGE pain, aching or stiffness to fully develop? Was it...\n
#> 518    Next, we'd like to talk to you about bowel health.  We'll start with accidental bowel leakage.  There are four types of bowel le
#> 519                      How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of mucus?
#> 520               How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of liquid stool?
#> 521                How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of solid stool?
#> 522    Let us talk about the amounts from different food groups that a person should eat each day.  How many cups of milk would you say
#> 523    How many cups of fruits would you say a {man/woman/person} of your age and physical activity should eat each day for good health
#> 524    How many cups of vegetables, including dark green, orange, starchy, and other vegetables, would you say a {man/woman/person} of 
#> 525    How many ounces of meat and beans would you say a {man/woman/person} of your age and physical activity should eat each day for g
#> 526          How many ounces of grains would you say a man/woman of your age and physical activity should eat each day for good health?
#> 527    How many ounces of "whole grains", would you say a {man/woman/person} of your age and physical activity should eat each day for 
#> 528                                               In the past 30 days, did you buy any food that had the word 'organic' on the package?
#> 529                                               In the past 30 days, did you buy any food that had the word 'organic' on the package?
#> 530    Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 531    Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 532                                            Have you looked up the MyPyramid plan for a {man/woman/person} your age on the internet?
#> 533                                            Have you looked up the MyPyramid plan for a {man/woman/person} your age on the internet?
#> 534    {Please turn to hand card 2.} About how many calories do you think a {man/woman} of your age and physical activity needs to cons
#> 535   {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.\nNow think about the "serving 
#> 536    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.  Now think about the "serving
#> 537    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer. Now think about the "serving 
#> 538   {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.\nNow think about the "serving 
#> 539    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.  Now think about the "serving
#> 540    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer. Now think about the "serving 
#> 541    {Now turn the page to use hand card 5.} Many food packages contain an expiration date such as "use by" or "sell by".  How often 
#> 542    {Now turn the page to use hand card 5.} Many food packages contain an expiration date such as "use by" or "sell by".  How often 
#> 543    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 544    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 545    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 546    {For the next few questions you'll use hand card 6 to respond, but first please look at hand card 5 which shows an example of th
#> 547    {For the next few questions you'll use hand card 6 to respond, but first please look at hand card 5 which shows an example of th
#> 548    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 8}.  How often
#> 549    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 8}.  How often
#> 550    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 551    Age in years of the household reference person at the time of HH screening.  Individuals 80 and over are topcoded at 80 years of
#> 552    Please look at this card, during the past month, how often did {you/SP} eat red meat, such as beef, pork, ham, or sausage? Do no
#> 553                          Within the last three hours have you eaten beets, broccoli, cabbage, celery, lettuce, spinach or radishes?
#> 554                                                                                         Language of the Family Interview Instrument
#> 555                              Did {SP} receive benefits from WIC when {he/she} {was/is} between the ages of 1 to {SP AGE} years old?
#> 556    Did (your/SP's) doctor or health professional tell (you/him/her) to avoid or limit alcoholic beverages (in the future) because o
#> 557                                                                                                            No coverage of any type.
#> 558                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 559    The next questions are about {your/your combined family} income.  When answering these questions, please remember that by {"inco
#> 560    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 561    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 562    During the past 12 months, how much did {your/her/his} leakage of urine affect {your/her/his} day-to-day activities?  Please sel
#> 563                                                               How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 564    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 565                                                                                       Language of the CAPI MEC Interview Instrument
#> 566    OCD231   What kind of business or industry is this? (For example: TV and radio management, retail shoe store, state labor depart
#> 567    What kind of business or industry is this? (For example: TV and radio management, retail shoe store, state labor department, far
#> 568    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100a) for the first time after ag
#> 569    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100b) for the first time after ag
#> 570    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100c) for the first time after ag
#> 571    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100d) for the first time after ag
#> 572    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100e) for the first time after ag
#> 573    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100f) for the first time after ag
#> 574    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bone after {you were/s/he was} 20 years of age
#> 575    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 576    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 577    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 578    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 579    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 580    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 581    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 582    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 583    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 584    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 585    Now I will ask you about TV watching and computer use. Over the past 30 days, on average how many hours per day did {SP} sit and
#> 586    Over the past 30 days, on average how many hours per day did {SP} use a computer or play computer games outside of school?  Woul
#> 587    [In the past 12 months], how often, on average, has {your/SP's} sleep been disturbed because of wheezing?  Would you say this ha
#> 588    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 589    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 590                            Best age in months at date of examination for individuals under 80 years of age at the time of MEC exam.
#> 591                                                      Best age in months at date of screening for individuals under 80 years of age.
#> 592           Best age in years of the sample person at time of HH screening.  Individuals 80 and over are topcoded at 80 years of age.
#> 593                                                                                               Age at Screening Adjudicated - Recode
#> 594                                                                                                                           Age group
#> 595                                                                                                                           Age group
#> 596                                                                                                                           Age group
#> 597                                                Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 598                                                                                  Language of the Sample Person Interview Instrument
#> 599    During the past 5 days {including today}, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhag
#> 600    {Do you/Does she/Does he} store paints or fuels inside {your/her/his} home? Include {your/her/his} basement {and attached garage
#> 601            First, I would like to ask you a few questions about {your/SP's} home. Does {your/her/his} home have an attached garage?
#> 602    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 603                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 604                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 605                                                                            What language(s) {do you/does SP} usually speak at home?
#> 606                                                                            What language(s) {do you/does SP} usually speak at home?
#> 607                                                                            What language(s) {do you/does SP} usually speak at home?
#> 608                               Now I'm going to ask you about language use. What language(s) {do you/does SP} usually speak at home?
#> 609                                                                                      Language of the MEC ACASI Interview Instrument
#> 610    The next questions are about drinking alcoholic beverages.  Included are liquor (such as whiskey or gin), beer, wine, wine coole
#> 611                    In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 612    In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 613    In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 614    In the past 12 months, on how many days did {you/SP} have 5 or more drinks of any alcoholic beverage? PROBE: How many days per w
#> 615    Was there ever a time or times in {your/SP's} life when {you/he/she} drank 5 or more drinks of any kind of alcoholic beverage al
#> 616    Next, we'd like to talk to you about bowel health.  We'll start with accidental bowel leakage.  There are four types of bowel le
#> 617                      How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of mucus?
#> 618               How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of liquid stool?
#> 619                How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of solid stool?
#> 620    Let us talk about the amounts from different food groups that a person should eat each day.  How many cups of milk would you say
#> 621    How many cups of fruits would you say a {man/woman/person} of your age and physical activity should eat each day for good health
#> 622    How many cups of vegetables, including dark green, orange, starchy, and other vegetables, would you say a {man/woman/person} of 
#> 623    How many ounces of meat and beans would you say a {man/woman/person} of your age and physical activity should eat each day for g
#> 624          How many ounces of grains would you say a man/woman of your age and physical activity should eat each day for good health?
#> 625    How many ounces of "whole grains", would you say a {man/woman/person} of your age and physical activity should eat each day for 
#> 626                                               In the past 30 days, did you buy any food that had the word 'organic' on the package?
#> 627    Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 628    Let's go ahead with the interview anyway.  Do you have a cereal box, can or package of food with a food label on the back or the
#> 629                                            Have you looked up the MyPyramid plan for a {man/woman/person} your age on the internet?
#> 630                                            Have you looked up the MyPyramid plan for a {man/woman/person} your age on the internet?
#> 631    {Please turn to hand card 2.} About how many calories do you think a {man/woman} of your age and physical activity needs to cons
#> 632   {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.\nNow think about the "serving 
#> 633   {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.\nNow think about the "serving 
#> 634    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.  Now think about the "serving
#> 635    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer.  Now think about the "serving
#> 636    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer. Now think about the "serving 
#> 637    {Now turn the page to use hand card 7.}  For this next question you may give more than one answer. Now think about the "serving 
#> 638    Many food packages contain an expiration date such as "use by" or "sell by".  How often do you use the expiration date when deci
#> 639    Many food packages contain an expiration date such as "use by" or "sell by".  How often do you use the expiration date when deci
#> 640    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 641    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 642    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 643    {For the next few questions you'll use hand card 6 to respond, but first please look at hand card 5 which shows an example of th
#> 644    {For the next few questions you'll use hand card 6 to respond, but first please look at hand card 5 which shows an example of th
#> 645    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 8}.  How often
#> 646    Some food packages contain health claims about the benefits of nutrients or foods {like the examples on hand card 8}.  How often
#> 647    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 648    Glycosylated (GLY-CO-SYL-AT-ED) hemoglobin or the "A one C" test measures the average level of blood sugar over the past 3 month
#> 649    Age in years of the household reference person at the time of HH screening.  Individuals 80 and over are topcoded at 80 years of
#> 650                          Within the last three hours have you eaten beets, broccoli, cabbage, celery, lettuce, spinach or radishes?
#> 651                                                                                         Language of the Family Interview Instrument
#> 652                              Did {SP} receive benefits from WIC when {he/she} {was/is} between the ages of 1 to {SP AGE} years old?
#> 653    Did (your/SP's) doctor or health professional tell (you/him/her) to avoid or limit alcoholic beverages (in the future) because o
#> 654                                                                                                            No coverage of any type.
#> 655                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 656    The next questions are about {your/your combined family} income.  When answering these questions, please remember that by {"inco
#> 657    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 658    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 659    During the past 12 months, how much did {your/her/his} leakage of urine affect {your/her/his} day-to-day activities?  Please sel
#> 660                                                               How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 661    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 662                                                                                       Language of the CAPI MEC Interview Instrument
#> 663    OCD231   What kind of business or industry is this? (For example: TV and radio management, retail shoe store, state labor depart
#> 664    What kind of business or industry is this? (For example: TV and radio management, retail shoe store, state labor department, far
#> 665    This variable provides information on the 3-level severity classification of age-related macular degeneration (ARM) from the rig
#> 666    This variable provides information on the presence or absence of retinal artery occlusion (branch or central), a blockage of ret
#> 667    This variable provides information on the presence or absence of retinal branch vein occlusion, a blockage of retinal branch ven
#> 668    This variable provides information on the presence or absence of retinal central vein occlusion (RCVO) from the right eye; block
#> 669               This variable provides information only on eyes with retinal blot hemorrhages and no microaneurysms in the right eye.
#> 670    This summary variable provides information on describing microaneurysms (MAS) only, blot hemorrhages (HEM) only, or both using t
#> 671              This variable provides information only on eyes with retinal microaneurysms and no retinal blot hemorrhage, right eye.
#> 672    This variable provides information on the presence or absence of pre-retinal hemorrhage or vitreous hemorrhage in the right eye.
#> 673    This variable provides information on the presence or absence of panretinal photocoagulation scars in the right eye.  Panretinal
#> 674    If a condition exists in the macula which confounds the grader from evaluating Age Related Macular Degeneration (ARM) lesions fr
#> 675    This variable provides information on the presence or absence of subretinal hemorrhage, a sign of exudative ARM, from the right 
#> 676    This variable provides information on the 3-level severity classification of age-related macular degeneration (ARM) from the lef
#> 677    This variable provides information on the presence or absence of retinal artery occlusion (branch or central), a blockage of ret
#> 678    This variable provides information on the presence or absence of retinal branch vein occlusion, a blockage of retinal branch ven
#> 679    This variable provides information on the presence or absence of retinal central vein occlusion (RCVO) from the left eye; blocka
#> 680                This variable provides information only on eyes with retinal blot hemorrhages and no microaneurysms in the left eye.
#> 681    This summary variable provides information on describing microaneurysms (MAS) only, blot hemorrhages (HEM) only, or both using t
#> 682               This variable provides information only on eyes with retinal microaneurysms and no retinal blot hemorrhage, left eye.
#> 683    This variable provides information on the presence or absence of pre-retinal hemorrhage or vitreous hemorrhage in the left eye. 
#> 684    This variable provides information on the presence or absence of panretinal photocoagulation scars in the left eye.  Panretinal 
#> 685    If a condition exists in the macula which confounds the grader from evaluating Age Related Macular Degeneration (ARM) lesions fr
#> 686    This variable provides information on the presence or absence of subretinal hemorrhage, a sign of exudative ARM, from the left e
#> 687    This variable provides information on the 3-level severity classification of age-related macular degeneration (ARM) from the wor
#> 688    This variable provides information on the presence or absence of retinal artery occlusion (branch or central), a blockage of ret
#> 689    This variable provides information on the presence or absence of retinal branch vein occlusion, a blockage of retinal branch ven
#> 690    This variable provides information on the presence or absence of retinal central vein occlusion (RCVO) from the worse eye; block
#> 691               This variable provides information only on eyes with retinal blot hemorrhages and no microaneurysms in the worse eye.
#> 692    This summary variable provides information describing microaneurysms (MAS) only, blot hemorrhages (HEM) only, or both, using two
#> 693              This variable provides information only on eyes with retinal microaneurysms and no retinal blot hemorrhage, worse eye.
#> 694    This variable provides information on the presence or absence of pre-retinal hemorrhage or vitreous hemorrhage in the worse eye.
#> 695    This variable provides information on the presence or absence of panretinal photocoagulation scars in the worse eye.  Panretinal
#> 696    This variable provides information on the presence or absence of subretinal hemorrhage, a sign of exudative ARM, from the worse 
#> 697                           Gradability of images, right eye.  This assumes at least one digital image of the right eye is available.
#> 698    The quality of images with a cup-to-disc ratio >= 0.6 was re-assessed before the images were re-read to look for indicators sugg
#> 699                           This variable provides the vertical cup disc ratio, in microns, from images that were re-read, right eye.
#> 700                             Gradability of images, left eye.  This assumes at least one digital image of the left eye is available.
#> 701    The quality of images with a cup-to-disc ratio >= 0.6 was re-assessed before the images were re-read to look for indicators sugg
#> 702                         This variable provides the  vertical cup disc ratio, in microns, from images that were re-read, left eye.\n
#> 703    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100a) for the first time after ag
#> 704    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100b) for the first time after ag
#> 705    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100c) for the first time after ag
#> 706    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100d) for the first time after ag
#> 707    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100e) for the first time after ag
#> 708    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100f) for the first time after ag
#> 709    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100g) for the first time after ag
#> 710    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100h) for the first time after ag
#> 711    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bone after {you were/s/he was} 20 years of age
#> 712    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 713    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 714    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 715    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 716    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 717    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 718    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 719    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 720    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 721    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 722    Now I will ask you about TV watching and computer use. Over the past 30 days, on average how many hours per day did {SP} sit and
#> 723    Over the past 30 days, on average how many hours per day did {SP} use a computer or play computer games outside of school?  Woul
#> 724                         Is {SP} able to take part at all in the usual kinds of play activities done by most children {his/her} age?
#> 725    [In the past 12 months], how often, on average, has {your/SP's} sleep been disturbed because of wheezing?  Would you say this ha
#> 726    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 727    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 728                                       Best age in months at date of examination for individuals under 80 years of age at screening.
#> 729                                                      Best age in months at date of screening for individuals under 80 years of age.
#> 730           Best age in years of the sample person at time of HH screening.  Individuals 80 and over are topcoded at 80 years of age.
#> 731                                                                                                                           Age group
#> 732                                                                                                                           Age group
#> 733                                                                                                                           Age group
#> 734                                                                                               Age at Screening Adjudicated - Recode
#> 735                                                Pregnancy status for females between 20 and 44 years of age at the time of MEC exam.
#> 736                                                                                  Language of the Sample Person Interview Instrument
#> 737    During the past 5 days {including today}, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhag
#> 738            {Have you/Has SP} ever been told by an eye doctor that {you have/s/he has} age-related macular (mac-u-lar) degeneration?
#> 739                           Was the age-related macular (mac-u-lar) degeneration in {your/his/her} right eye, left eye, or both eyes?
#> 740                            Keratometric measure. Dioptric power of the cornea averaged across meridians in the examinee's left eye.
#> 741                    Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's left eye.
#> 742                           Keratometric measure. Dioptric power of the cornea averaged across meridians in the examinee's right eye.
#> 743                   Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's right eye.
#> 744    {Do you/Does she/Does he} store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and attached garag
#> 745    {Do you/Does she/Does he} store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and attached garag
#> 746    {Do you/Does she/Does he} store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and attached garag
#> 747                  I would like to ask you a few questions about {your/SP's} home.  Does {your/her/his} home have an attached garage?
#> 748                                                                                             Does your home have an attached garage?
#> 749                                                                                             Does your home have an attached garage?
#> 750    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 751                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 752                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 753                                                                            What language(s) {do you/does SP} usually speak at home?
#> 754                                                                            What language(s) {do you/does SP} usually speak at home?
#> 755                                                                            What language(s) {do you/does SP} usually speak at home?
#> 756                               Now I'm going to ask you about language use. What language(s) {do you/does SP} usually speak at home?
#> 757                                                                                        At what age did this itchy rash first occur?
#> 758                                                                                      Language of the MEC ACASI Interview Instrument
#> 759    The next questions are about drinking alcoholic beverages.  Included are liquor (such as whiskey or gin), beer, wine, wine coole
#> 760                    In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 761    In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 762    In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 763    In the past 12 months, on how many days did {you/SP} have 5 or more drinks of any alcoholic beverage? PROBE: How many days per w
#> 764    Was there ever a time or times in {your/SP's} life when {you/he/she} drank 5 or more drinks of any kind of alcoholic beverage al
#> 765    Next, we'd like to talk to you about bowel health.  We'll start with accidental bowel leakage.  There are four types of bowel le
#> 766                      How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of mucus?
#> 767               How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of liquid stool?
#> 768                How often during the past 30 days have you had any amount of accidental bowel leakage that consisted of solid stool?
#> 769    Next, Im going to ask you about meals.  By meal, I mean breakfast, lunch and dinner.  On average, how many meals per week {do yo
#> 770    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 771    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 772    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 773    Some food packages contain health claims about the benefits of nutrients or foods like the examples on this card.  [HAND CARD DB
#> 774    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 775    Glycosylated (GLY-CO-SYL-AT-ED) hemoglobin or the "A one C" test measures the average level of blood sugar over the past 3 month
#> 776    Age in years of the household reference person at the time of HH screening.  Individuals 85 and over are topcoded at 85 years of
#> 777                                                                                                                         Dosage form
#> 778      How often did you drink milk as a beverage (NOT in coffee, NOT in cereal)?  (Please include chocolate milk and hot chocolate.)
#> 779    How often did you drink meal replacement, energy, or high protein beverages such as Instant Breakfast, Ensure, Slimfast, Sustaca
#> 780                                                                  How often did you eat sauerkraut or cabbage (other than coleslaw)?
#> 781                How often did you eat your pasta, spaghetti, or other noodles with tomato sauce or spagetti sauce made WITHOUT meat?
#> 782                                                                                    How often did you eat bagels or English muffins?
#> 783                                           How often did you eat jam, jelly, or honey on bagels, muffins, bread, rolls, or crackers?
#> 784                           How often did you eat hot dogs or frankfurters?  (Please do not include sausages or vegetarian hot dogs.)
#> 785     How often did you eat pork (including chops, roasts, and in mixed dishes)?  (Please do not include ham, ham steak, or sausage.)
#> 786                                                                                  How often did you eat sausage (including low-fat)?
#> 787                                                                  How often was the sausage you ate light, low-fat, or lean sausage?
#> 788                                                                 How often did you eat pizza with pepperoni, sausage, or other meat?
#> 789                                                                           How often did you eat cottage cheese (including low-fat)?
#> 790    How often was sugar or honey added to foods you ate?  (Please do not include sugar in coffee, tea, other beverages, or baked goo
#> 791                            How often did you eat margarine on breads, bagels, English muffins, other muffins, pancakes, or waffles?
#> 792                               How often did you eat butter on breads, bagels, English muffins, other muffins, pancakes, or waffles?
#> 793                                                                                         Language of the Family Interview Instrument
#> 794    Did (your/SP's) doctor or health professional tell (you/him/her) to avoid or limit alcoholic beverages (in the future) because o
#> 795                                                                                                            No coverage of any type.
#> 796                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 797    Many people have leakage of urine.  The next few questions ask about urine leakage.  How often {do you/does SP} have urinary lea
#> 798    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 799    During the past 12 months, how much did {you/her/his} leakage of urine affect {you/her/his} day-to-day activities?  Please selec
#> 800                                                               How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 801    Including living and deceased, were any of {SP's/your} close biological that is, blood relatives including father, mother, siste
#> 802                                                                                       Language of the CAPI MEC Interview Instrument
#> 803    OCD231   What kind of business or industry is this? (For example: TV and radio management, retail shoe store, state labor depart
#> 804    This variable provides information on the 3-level severity classification of age-related macular degeneration (ARM) from the rig
#> 805    This variable provides information on the presence or absence of retinal artery occlusion (branch or central), a blockage of ret
#> 806    This variable provides information on the presence or absence of retinal branch vein occlusion, a blockage of retinal branch ven
#> 807    This variable provides information on the presence or absence of retinal central vein occlusion (RCVO) from the right eye; block
#> 808               This variable provides information only on eyes with retinal blot hemorrhages and no microaneurysms in the right eye.
#> 809    This summary variable provides information on describing microaneurysms (MAS) only, blot hemorrhages (HEM) only, or both using t
#> 810              This variable provides information only on eyes with retinal microaneurysms and no retinal blot hemorrhage, right eye.
#> 811    This variable provides information on the presence or absence of pre-retinal hemorrhage or vitreous hemorrhage in the right eye.
#> 812    This variable provides information on the presence or absence of panretinal photocoagulation scars in the right eye.  Panretinal
#> 813    If a condition exists in the macula which confounds the grader from evaluating Age Related Macular Degeneration (ARM) lesions fr
#> 814    This variable provides information on the presence or absence of subretinal hemorrhage, a sign of exudative ARM, from the right 
#> 815    This variable provides information on the 3-level severity classification of age-related macular degeneration (ARM) from the lef
#> 816    This variable provides information on the presence or absence of retinal artery occlusion (branch or central), a blockage of ret
#> 817    This variable provides information on the presence or absence of retinal branch vein occlusion, a blockage of retinal branch ven
#> 818    This variable provides information on the presence or absence of retinal central vein occlusion (RCVO) from the left eye; blocka
#> 819                This variable provides information only on eyes with retinal blot hemorrhages and no microaneurysms in the left eye.
#> 820    This summary variable provides information on describing microaneurysms (MAS) only, blot hemorrhages (HEM) only, or both using t
#> 821               This variable provides information only on eyes with retinal microaneurysms and no retinal blot hemorrhage, left eye.
#> 822    This variable provides information on the presence or absence of pre-retinal hemorrhage or vitreous hemorrhage in the left eye. 
#> 823    This variable provides information on the presence or absence of panretinal photocoagulation scars in the left eye.  Panretinal 
#> 824    If a condition exists in the macula which confounds the grader from evaluating Age Related Macular Degeneration (ARM) lesions fr
#> 825    This variable provides information on the presence or absence of subretinal hemorrhage, a sign of exudative ARM, from the left e
#> 826    This variable provides information on the 3-level severity classification of age-related macular degeneration (ARM) from the wor
#> 827    This variable provides information on the presence or absence of retinal artery occlusion (branch or central), a blockage of ret
#> 828    This variable provides information on the presence or absence of retinal branch vein occlusion, a blockage of retinal branch ven
#> 829    This variable provides information on the presence or absence of retinal central vein occlusion (RCVO) from the worse eye; block
#> 830               This variable provides information only on eyes with retinal blot hemorrhages and no microaneurysms in the worse eye.
#> 831    This summary variable provides information describing microaneurysms (MAS) only, blot hemorrhages (HEM) only, or both, using two
#> 832              This variable provides information only on eyes with retinal microaneurysms and no retinal blot hemorrhage, worse eye.
#> 833    This variable provides information on the presence or absence of pre-retinal hemorrhage or vitreous hemorrhage in the worse eye.
#> 834    This variable provides information on the presence or absence of panretinal photocoagulation scars in the worse eye.  Panretinal
#> 835    This variable provides information on the presence or absence of subretinal hemorrhage, a sign of exudative ARM, from the worse 
#> 836                           Gradability of images, right eye.  This assumes at least one digital image of the right eye is available.
#> 837    The quality of images with a cup-to-disc ratio >= 0.6 was re-assessed before the images were re-read to look for indicators sugg
#> 838                           This variable provides the vertical cup disc ratio, in microns, from images that were re-read, right eye.
#> 839                             Gradability of images, left eye.  This assumes at least one digital image of the left eye is available.
#> 840    The quality of images with a cup-to-disc ratio >= 0.6 was re-assessed before the images were re-read to look for indicators sugg
#> 841                           This variable provides the  vertical cup disc ratio, in microns, from images that were re-read, left eye.
#> 842    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100a) for the first time after ag
#> 843    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100b) for the first time after ag
#> 844    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100c) for the first time after ag
#> 845    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100d) for the first time after ag
#> 846    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100e) for the first time after ag
#> 847    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100f) for the first time after ag
#> 848    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100g) for the first time after ag
#> 849    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100h) for the first time after ag
#> 850    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100i) for the first time after ag
#> 851    How old {were you/was SP} when {you/SP} fractured {your/his/her} (fracture site selected in OSQ100j) for the first time after ag
#> 852    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bone after {you were/s/he was} 20 years of age
#> 853    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 854    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 855    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 856    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 857    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 858    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 859    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 860    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 861    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 862    Has a doctor ever told {you/SP} that {you/s/he} had broken or fractured any other bones after {you were/s/he was} 20 years of ag
#> 863           Over the past 30 days, on average about how many hours per day did {you/SP} sit and watch TV or videos?  Would you say...
#> 864    Over the past 30 days, on average about how many hours per day did {you/SP} use a computer or play computer games?  Would you sa
#> 865                                            [Over the past 30 days], on average about how long did {you/SP} do {activity} each time?
#> 866  (MEC Interview Version) Compared with most {boys/girls} {your/SP's} age, would you say that {you are/SP is}...\n\n(SP Interview Ve
#> 867                         Is {SP} able to take part at all in the usual kinds of play activities done by most children {his/her} age?
#> 868    Health care providers order PSA tests for different reasons.  Please answer yes if any of the following reasons are true.  Your 
#> 869                                                            Some men who develop prostate cancer live to be 70 years of age or more.
#> 870                                                                                           What language was used for the interview?
#> 871    [In the past 12 months], how often, on average, has {your/SP's} sleep been disturbed because of wheezing?  Would you say this ha
#> 872    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 873    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 874                                       Best age in months at date of examination for individuals under 85 years of age at screening.
#> 875                                                      Best age in months at date of screening for individuals under 85 years of age.
#> 876           Best age in years of the sample person at time of HH screening.  Individuals 85 and over are topcoded at 85 years of age.
#> 877                                                                                               Age at Screening Adjudicated - Recode
#> 878                                                                                                                          Age group 
#> 879                                                                                                                           Age group
#> 880                                                                                                                           Age group
#> 881                                                                                  Language of the Sample Person Interview Instrument
#> 882                                                                 On average, how many cigarettes {do you/does SP} now smoke per day?
#> 883    During the past 5 days {including today}, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhag
#> 884            {Have you/Has SP} ever been told by an eye doctor that {you have/s/he has} age-related macular (mac-u-lar) degeneration?
#> 885                           Was the age-related macular (mac-u-lar) degeneration in {your/his/her} right eye, left eye, or both eyes?
#> 886                           Keratometric measure. Dioptric power of the cornea averaged across meridians in the examinee's right eye.
#> 887                    Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's left eye.
#> 888                           Keratometric measure. Dioptric power of the cornea averaged across meridians in the examinee's right eye.
#> 889                   Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's right eye.
#> 890    {Do you/Does she/Does he} store paints or fuels inside {your/her/his} home?  Include {your/her/his} basement {and attached garag
#> 891                  I would like to ask you a few questions about {your/SP's} home.  Does {your/her/his} home have an attached garage?
#> 892                                                                                             Does your home have an attached garage?
#> 893    How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 894                How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 895                         How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 896                                                                            What language(s) {do you/does SP} usually speak at home?
#> 897                                                                            What language(s) {do you/does SP} usually speak at home?
#> 898                                                                            What language(s) {do you/does SP} usually speak at home?
#> 899                                                          What language(s) {do you/does SP} usually speak at home?  Would you say...
#> 900          The next questions are about language.  In general, what language(s) {do you/does SP} read and speak.  Would you say . . .
#> 901                                                                What was the language(s) {you/SP} used as a child?  Would you say...
#> 902                                                              In which language(s) {do you/does SP} usually think?  Would you say...
#> 903                                      What language(s) {do you/does SP} usually speak with {your/his/her} friends?  Would you say...
#> 904                                                                                      Language of the MEC ACASI Interview Instrument
#> 905    The next questions are about drinking alcoholic beverages. Included are liquor (such as whiskey or gin), beer, wine, wine cooler
#> 906                    In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 907    In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 908    In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 909    In the past 12 months, on how many days did {you/SP} have 5 or more drinks of any alcoholic beverage? PROBE: How many days per w
#> 910    Was there ever a time or times in {your/SP's} life when {you/he/she} drank 5 or more drinks of any kind of alcoholic beverage al
#> 911          Outside of work, {have you/has SP} ever been exposed to firearms noise for an average of at least once a month for a year?
#> 912    Outside of work, {have you/has SP} ever been exposed to other types of loud noise,  such as noise from power tools or loud music
#> 913    Can you remember your exact age the very first time in your life you had a period lasting two weeks or longer of (being sad, dep
#> 914                              What's the earliest age you can clearly remember a particular time when you had a period of this sort?
#> 915    Can you remember your exact age the very first time in your life you had a period of worry, tension, or anxiety like the one you
#> 916                              What's the earliest age you can clearly remember a particular time when you had a period of this sort?
#> 917                                                                          Can you remember your EXACT age when your attack occurred?
#> 918                                                                                                     Exact age when attack occurred?
#> 919                                                   Can you remember your exact age the very first time you had one of these attacks?
#> 920                                                   (IF NEC: How old were you?) (IF RESPONSE = REF, ENTER 99) __________ YEARS OF AGE
#> 921                               What's the earliest age you can clearly remember a particular time when you had one of these attacks?
#> 922                                               Exercise protocol used in stage 1 and stage 2 after adjustment for warm-up heart rate
#> 923                                                                                            Stage 1 diastolic blood pressure (mm Hg)
#> 924                                                                                                           Stage 1 grade (% incline)
#> 925                                                                                                     Stage 1 heart rate (per minute)
#> 926                                                                                                      Stage 1 speed (miles per hour)
#> 927                                                                                             Stage 1 systolic blood pressure (mm Hg)
#> 928                                                                                           Amount of time spent in Stage 1 (minutes)
#> 929                                                                                            Stage 2 diastolic blood pressure (mm Hg)
#> 930                                                                                                           Stage 2 grade (% incline)
#> 931                                                                                                     Stage 2 heart rate (per minute)
#> 932                                                                                                      Stage 2 speed (miles per hour)
#> 933                                                                                             Stage 2 systolic blood pressure (mm Hg)
#> 934                                                                                           Amount of time spent in Stage 2 (minutes)
#> 935                                Reason for Priority 2 Stop: Heart rate exceeds predetermined limit during first 2 minutes of stage 2
#> 936                                                   Reason for Priority 2 Stop: Heart rate exceeds predetermined limit during stage 1
#> 937    Reason for Priority 2 Stop: Sudden, noticeable variability in heart rate (sudden change of more than 30 beats/minute during a st
#> 938                                                                                          Stage 1 rating of perceived exertion (RPE)
#> 939                                                                                          Stage 2 rating of perceived exertion (RPE)
#> 940    {Next I have some general questions about {your/SP's} eating habits.}  {First/Next} are questions about the kinds of food {you e
#> 941    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 942    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 943    Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 944                                                                                                     Back with elbows image captured
#> 945                                                                                                      Back image not captured reason
#> 946                                                                                                 Front leg image not captured reason
#> 947                                                                                             Front of legs with hands image captured
#> 948                                                                                                 Inner arm image not captured reason
#> 949                                                                                                            Inner arm image captured
#> 950                                                                                                 Lower leg image not captured reason
#> 951                                                                                               Back of leg with palms image captured
#> 952    {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 953    Age in years of the household reference person at the time of HH screening.  Individuals 85 and over are topcoded at 85 years of
#> 954                                                                                                                         Dosage form
#> 955      How often did you drink milk as a beverage (NOT in coffee, NOT in cereal)?  (Please include chocolate milk and hot chocolate.)
#> 956    How often did you drink meal replacement, energy, or high protein beverages such as Instant Breakfast, Ensure, Slimfast, Sustaca
#> 957                                                                  How often did you eat sauerkraut or cabbage (other than coleslaw)?
#> 958                How often did you eat your pasta, spaghetti, or other noodles with tomato sauce or spagetti sauce made WITHOUT meat?
#> 959                                                                                    How often did you eat bagels or English muffins?
#> 960                                           How often did you eat jam, jelly, or honey on bagels, muffins, bread, rolls, or crackers?
#> 961                           How often did you eat hot dogs or frankfurters?  (Please do not include sausages or vegetarian hot dogs.)
#> 962     How often did you eat pork (including chops, roasts, and in mixed dishes)?  (Please do not include ham, ham steak, or sausage.)
#> 963                                                                                  How often did you eat sausage (including low-fat)?
#> 964                                                                  How often was the sausage you ate light, low-fat, or lean sausage?
#> 965                                                                 How often did you eat pizza with pepperoni, sausage, or other meat?
#> 966                                                                           How often did you eat cottage cheese (including low-fat)?
#> 967    How often was sugar or honey added to foods you ate?  (Please do not include sugar in coffee, tea, other beverages, or baked goo
#> 968                            How often did you eat margarine on breads, bagels, English muffins, other muffins, pancakes, or waffles?
#> 969                               How often did you eat butter on breads, bagels, English muffins, other muffins, pancakes, or waffles?
#> 970                                                                                         Language of the Family Interview Instrument
#> 971    Did (your/SP's) doctor or health professional tell (you/him/her) to avoid or limit alcoholic beverages (in the future) because o
#> 972                                 In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 973                                                            About how long has it been since {you/SP} last had health care coverage?
#> 974    In any of these rooms, can you see at least one total area of peeling, flaking or chipping paint that is larger than one page of
#> 975      How many rooms have this much peeling, flaking or chipping paint?  [Areas that are larger than one page of regular newspaper.]
#> 976    Many people experience leakage of urine.  The next few questions ask about urine leakage under different conditions.  During the
#> 977    During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 978    During the past 12 months, how much did {you/her/his} leakage of urine affect {you/her/his} day-to-day activities?  Please selec
#> 979                                                               How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 980    Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 981    Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 982                                                                                       Language of the CAPI MEC Interview Instrument
#> 983    What kind of business or industry is this?  (For example:  TV and radio management, retail shoe store, state labor department, f
#> 984                                        On average, for how many hours per day {are you/is SP} currently exposed to this loud noise?
#> 985                                         On average, for how many hours per day {were you/was SP} exposed to loud noise in that job?
#> 986           Over the past 30 days, on average about how many hours per day did {you/SP} sit and watch TV or videos?  Would you say...
#> 987    Over the past 30 days, on average about how many hours per day did {you/SP} use a computer or play computer games?  Would you sa
#> 988                                            [Over the past 30 days], on average about how long did {you/SP} do {activity} each time?
#> 989  (MEC Interview Version) Compared with most {boys/girls} {your/SP's} age, would you say that {you are/SP is}...\n\n(SP Interview Ve
#> 990                         Is {SP} able to take part at all in the usual kinds of play activities done by most children {his/her} age?
#> 991    Health care providers order PSA tests for different reasons.  Please answer yes if any of the following reasons are true.  Your 
#> 992                                                            Some men who develop prostate cancer live to be 70 years of age or more.
#> 993                                                                                           What language was used for the interview?
#> 994    [In the past 12 months], how often, on average, has {your/SP's} sleep been disturbed because of wheezing?  Would you say this ha
#> 995    The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 996    How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 997                                       Best age in months at date of examination for individuals under 85 years of age at screening.
#> 998                                                      Best age in months at date of screening for individuals under 85 years of age.
#> 999           Best age in years of the sample person at time of HH screening.  Individuals 85 and over are topcoded at 85 years of age.
#> 1000                                     On average, how many pills or doses of {PRODUCT NAME} {do you/does SP} take in a \nsingle day?
#> 1001                                                                                 Language of the Sample Person Interview Instrument
#> 1002                                                                On average, how many cigarettes {do you/does SP} now smoke per day?
#> 1003          {Have you/Has SP} used snuff, such as Skoal, Skoal Bandit, or Copenhagen at least 20 times in {your/his/her} entire life?
#> 1004   During the past 5 days {including today}, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhag
#> 1005                          Keratometric measure.  Dioptric power of the cornea averaged across meridians in the examinee's left eye.
#> 1006                   Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's left eye.
#> 1007                          Keratometric measure.  Dioptric power of the cornea averaged across meridians in the examinee's right eye
#> 1008                  Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's right eye.
#> 1009                                  I would like to ask you a few questions about your home.  Does your home have an attached garage?
#> 1010              How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]
#> 1011               How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 1012                        How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 1013                                                                           What language(s) {do you/does SP} usually speak at home?
#> 1014                                                                           What language(s) {do you/does SP} usually speak at home?
#> 1015                                                                           What language(s) {do you/does SP} usually speak at home?
#> 1016                                                         What language(s) {do you/does SP} usually speak at home?  Would you say...
#> 1017         The next questions are about language.  In general, what language(s) {do you/does SP} read and speak.  Would you say . . .
#> 1018                                                                What was the language(s) {you/SP} used as a child?  Would you say …
#> 1019                                                             In which language(s) {do you/does SP} usually think?  Would you say...
#> 1020                                     What language(s) {do you/does SP} usually speak with {your/his/her} friends?  Would you say...
#> 1021   The next questions are about drinking alcoholic beverages. Included are liquor (such as whiskey or gin), beer, wine, wine cooler
#> 1022                   In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 1023   In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 1024   In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 1025   In the past 12 months, on how many days did {you/SP} have 5 or more drinks of any alcoholic beverage? PROBE: How many days per w
#> 1026   Was there ever a time or times in {your/SP's} life when {you/he/she} drank 5 or more drinks of any kind of alcoholic beverage al
#> 1027         Outside of work, {have you/has SP} ever been exposed to firearms noise for an average of at least once a month for a year?
#> 1028   Outside of work, {have you/has SP} ever been exposed to other types of loud noise,  such as noise from power tools or loud music
#> 1029                                                                                                  Diastolic blood pressure average:
#> 1030                                                                                                   Systolic blood pressure average:
#> 1031   Can you remember your exact age the very first time in your life you had a period lasting two weeks or longer of (being sad, dep
#> 1032                             What's the earliest age you can clearly remember a particular time when you had a period of this sort?
#> 1033   Can you remember your exact age the very first time in your life you had a period of worry, tension, or anxiety like the one you
#> 1034                             What's the earliest age you can clearly remember a particular time when you had a period of this sort?
#> 1035                                                                         Can you remember your EXACT age when your attack occurred?
#> 1036                                                                                                    Exact age when attack occurred?
#> 1037                                                  Can you remember your exact age the very first time you had one of these attacks?
#> 1038                                                  (IF NEC: How old were you?) (IF RESPONSE = REF, ENTER 99) __________ YEARS OF AGE
#> 1039                              What's the earliest age you can clearly remember a particular time when you had one of these attacks?
#> 1040                                              Exercise protocol used in stage 1 and stage 2 after adjustment for warm-up heart rate
#> 1041                                                                                           Stage 1 diastolic blood pressure (mm Hg)
#> 1042                                                                                                          Stage 1 grade (% incline)
#> 1043                                                                                                    Stage 1 heart rate (per minute)
#> 1044                                                                                                     Stage 1 speed (miles per hour)
#> 1045                                                                                            Stage 1 systolic blood pressure (mm Hg)
#> 1046                                                                                          Amount of time spent in Stage 1 (minutes)
#> 1047                                                                                           Stage 2 diastolic blood pressure (mm Hg)
#> 1048                                                                                                          Stage 2 grade (% incline)
#> 1049                                                                                                    Stage 2 heart rate (per minute)
#> 1050                                                                                                     Stage 2 speed (miles per hour)
#> 1051                                                                                            Stage 2 systolic blood pressure (mm Hg)
#> 1052                                                                                          Amount of time spent in Stage 2 (minutes)
#> 1053                               Reason for Priority 2 Stop: Heart rate exceeds predetermined limit during first 2 minutes of stage 2
#> 1054                                                  Reason for Priority 2 Stop: Heart rate exceeds predetermined limit during stage 1
#> 1055   Reason for Priority 2 Stop: Sudden, noticeable variability in heart rate (sudden change of more than 30 beats/minute during a st
#> 1056                                                                                         Stage 1 rating of perceived exertion (RPE)
#> 1057                                                                                         Stage 2 rating of perceived exertion (RPE)
#> 1058   {Next I have some general questions about {your/SP's} eating habits.}  {First/Next} are questions about the kinds of food {you e
#> 1059   Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 1060   Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 1061   Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 1062   {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 1063   Age in years of the household reference person at the time of HH screening.  Individuals 85 and over are topcoded at 85 years of
#> 1064                                                                                                                        Dosage form
#> 1065   Did (your/SP's) doctor or health professional tell (you/him/her) to avoid or limit alcoholic beverages (in the future) because o
#> 1066                                In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 1067                                                           About how long has it been since {you/SP} last had health care coverage?
#> 1068   In any of these rooms, can you see at least one total area of peeling, flaking or chipping paint that is larger than one page of
#> 1069     How many rooms have this much peeling, flaking or chipping paint?  [Areas that are larger than one page of regular newspaper.]
#> 1070   Many people experience leakage of urine.  The next few questions ask about urine leakage under different conditions.  During the
#> 1071   During the past 12 months, how much did {your/her/his} leakage of urine bother {you/her/him}?  Please select one of the followin
#> 1072   During the past 12 months, how much did {you/her/his} leakage of urine affect {you/her/his} day-to-day activities?  Please selec
#> 1073                                                              How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 1074   Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 1075   Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 1076                                                                                                       Average peak force (Newtons)
#> 1077   What kind of business or industry is this?  (For example:  TV and radio management, retail shoe store, state labor department, f
#> 1078                                       On average, for how many hours per day {are you/is SP} currently exposed to this loud noise?
#> 1079                                        On average, for how many hours per day {were you/was SP} exposed to loud noise in that job?
#> 1080          Over the past 30 days, on average about how many hours per day did {you/SP} sit and watch TV or videos?  Would you say...
#> 1081   Over the past 30 days, on average about how many hours per day did {you/SP} use a computer or play computer games?  Would you sa
#> 1082                                           [Over the past 30 days], on average about how long did {you/SP} do {activity} each time?
#> 1083 (MEC Interview Version) Compared with most {boys/girls} {your/SP's} age, would you say that {you are/SP is}...\n\n(SP Interview Ve
#> 1084                                                                                                                                Age
#> 1085                        Is {SP} able to take part at all in the usual kinds of play activities done by most children {his/her} age?
#> 1086   [In the past 12 months], how often, on average, has {your/SP's} sleep been disturbed because of wheezing?  Would you say this ha
#> 1087   The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 1088   How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 1089                                      Best age in months at date of examination for individuals under 85 years of age at screening.
#> 1090                                                     Best age in months at date of screening for individuals under 85 years of age.
#> 1091          Best age in years of the sample person at time of HH screening.  Individuals 85 and over are topcoded at 85 years of age.
#> 1092                                                                                                                          Age Group
#> 1093                                                                                                                          Age Group
#> 1094                                                                                                                          Age Group
#> 1095                                     On average, how many pills or doses of {PRODUCT NAME} {do you/does SP} take in a \nsingle day?
#> 1096                                                                On average, how many cigarettes {do you/does SP} now smoke per day?
#> 1097          {Have you/Has SP} used snuff, such as Skoal, Skoal Bandit, or Copenhagen at least 20 times in {your/his/her} entire life?
#> 1098   During the past 5 days {including today}, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhag
#> 1099                          Keratometric measure.  Dioptric power of the cornea averaged across meridians in the examinee's left eye.
#> 1100                   Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's left eye.
#> 1101                          Keratometric measure.  Dioptric power of the cornea averaged across meridians in the examinee's right eye
#> 1102                Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's right eye.  
#> 1103              How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]
#> 1104               How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 1105                        How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 1106                                                                           What language(s) {do you/does SP} usually speak at home?
#> 1107                                                                           What language(s) {do you/does SP} usually speak at home?
#> 1108                                                                           What language(s) {do you/does SP} usually speak at home?
#> 1109                                                         What language(s) {do you/does SP} usually speak at home?  Would you say...
#> 1110         The next questions are about language.  In general, what language(s) {do you/does SP} read and speak.  Would you say . . .
#> 1111                                                              What was the language(s) {you/SP} used as a child?  Would you say ...
#> 1112                                                             In which language(s) {do you/does SP} usually think?  Would you say...
#> 1113                                     What language(s) {do you/does SP} usually speak with {your/his/her} friends?  Would you say...
#> 1114   The next questions are about alcoholic beverages. When answering think about {your/SP's} use over the past 30 days. How often di
#> 1115   The next questions are about drinking alcoholic beverages. Included are liquor (such as whiskey or gin), beer, wine, wine cooler
#> 1116                   In {your/SP's} entire life, {have you/has he/ has she} had at least 12 drinks of any type of alcoholic beverage?
#> 1117   In the past 12 months, how often did {you/SP} drink any type of alcoholic beverage? PROBE: How many days per week, per month, or
#> 1118   In the past 12 months, on those days that {you/SP} drank alcoholic beverages, on the average, how many drinks did {you/he/she} h
#> 1119   In the past 12 months, on how many days did {you/SP} have 5 or more drinks of any alcoholic beverage? PROBE: How many days per w
#> 1120   Was there ever a time or times in {your/SP's} life when {you/he/she} drank 5 or more drinks of any kind of alcoholic beverage al
#> 1121         Outside of work, {have you/has SP} ever been exposed to firearms noise for an average of at least once a month for a year?
#> 1122   Outside of work, {have you/has SP} ever been exposed to other types of loud noise,  such as noise from power tools or loud music
#> 1123                                                                                                  Diastolic blood pressure average:
#> 1124                                                                                                   Systolic blood pressure average:
#> 1125   Can you remember your exact age the very first time in your life you had a period lasting two weeks or longer of (being sad, dep
#> 1126                             What's the earliest age you can clearly remember a particular time when you had a period of this sort?
#> 1127   Can you remember your exact age the very first time in your life you had a period of worry, tension, or anxiety like the one you
#> 1128                             What's the earliest age you can clearly remember a particular time when you had a period of this sort?
#> 1129                                                                         Can you remember your EXACT age when your attack occurred?
#> 1130                                                                                                    Exact age when attack occurred?
#> 1131                                                  Can you remember your exact age the very first time you had one of these attacks?
#> 1132                                                  (IF NEC: How old were you?) (IF RESPONSE = REF, ENTER 99) __________ YEARS OF AGE
#> 1133                              What's the earliest age you can clearly remember a particular time when you had one of these attacks?
#> 1134                                              Exercise protocol used in stage 1 and stage 2 after adjustment for warm-up heart rate
#> 1135                                                                                           Stage 1 diastolic blood pressure (mm Hg)
#> 1136                                                                                                          Stage 1 grade (% incline)
#> 1137                                                                                                    Stage 1 heart rate (per minute)
#> 1138                                                                                                     Stage 1 speed (miles per hour)
#> 1139                                                                                            Stage 1 systolic blood pressure (mm Hg)
#> 1140                                                                                          Amount of time spent in Stage 1 (minutes)
#> 1141                                                                                           Stage 2 diastolic blood pressure (mm Hg)
#> 1142                                                                                                          Stage 2 grade (% incline)
#> 1143                                                                                                    Stage 2 heart rate (per minute)
#> 1144                                                                                                     Stage 2 speed (miles per hour)
#> 1145                                                                                            Stage 2 systolic blood pressure (mm Hg)
#> 1146                                                                                          Amount of time spent in Stage 2 (minutes)
#> 1147                               Reason for Priority 2 Stop: Heart rate exceeds predetermined limit during first 2 minutes of stage 2
#> 1148                                                  Reason for Priority 2 Stop: Heart rate exceeds predetermined limit during stage 1
#> 1149   Reason for Priority 2 Stop: Sudden, noticeable variability in heart rate (sudden change of more than 30 beats/minute during a st
#> 1150                                                                                         Stage 1 rating of perceived exertion (RPE)
#> 1151                                                                                         Stage 2 rating of perceived exertion (RPE)
#> 1152   {Next I have some general questions about {your/SP's} eating habits.}  {First/Next} are questions about the kinds of food {you e
#> 1153   Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 1154   Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 1155   Now, I'm going to ask you how often {you/SP} drank milk at different times in {your/his/her} life.  How often did {you/SP} drink
#> 1156   The next question are about the amout of food {you/SP}eat{s}. On average day, how many helpings of the following kinds of foods 
#> 1157   On the average day, how may helpings of the following kinds of foods {do you/does SP} eat? Milk or dairy foods that are made fro
#> 1158                   On an average day, how many helpings of the following kinds of foods {do you/does SP}eat? Fruis or fruit juices.
#> 1159   On an average day, how many helpings of the following kinds of foods {do you/does SP}eat? Vegetables, including vegetable salads
#> 1160   On an average day, how many helpings of the following kinds of foods {do you/does SP}eat? Breads and other foods that are made f
#> 1161   {Is SP/Are you} now taking diabetic pills to lower {{his/her}/your} blood sugar?  These are sometimes called oral agents or oral
#> 1162   Age in years of the household reference person at the time of HH screening.  Individuals 85 and over are topcoded at 85 years of
#> 1163                                                                                                                        Dosage form
#> 1164                                In the past 12 months, was there any time when {you/SP} did not have any health insurance coverage?
#> 1165                                                           About how long has it been since {you/SP} last had health care coverage?
#> 1166   In any of these rooms, can you see at least one total area of peeling, flaking or chipping paint that is larger than one page of
#> 1167     How many rooms have this much peeling, flaking or chipping paint?  [Areas that are larger than one page of regular newspaper.]
#> 1168                                                              How old (were you/was SP) when esophageal cancer was first diagnosed?
#> 1169   Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 1170   Including living and deceased, were any of {SP's/ your} biological that is, blood relatives including grandparents, parents, bro
#> 1171                                                                                                       Average peak force (Newtons)
#> 1172   What kind of business or industry is this?  (For example:  TV and radio management, retail shoe store, state labor department, f
#> 1173   The next question is about work at a job or business.  On the average, how many hours per week does {SP} work in a paid or unpai
#> 1174                                       On average, for how many hours per day {are you/is SP} currently exposed to this loud noise?
#> 1175                                        On average, for how many hours per day {were you/was SP} exposed to loud noise in that job?
#> 1176                                           [Over the past 30 days], on average about how long did {you/SP} do {activity} each time?
#> 1177 (MEC Interview Version) Compared with most {boys/girls} {your/SP's} age, would you say that {you are/SP is}...\n\n(SP Interview Ve
#> 1178                        Is {SP} able to take part at all in the usual kinds of play activities done by most children {his/her} age?
#> 1179   [In the past 12 months], how often, on average, has {your/SP's} sleep been disturbed because of wheezing?  Would you say this ha
#> 1180   The next questions are about {your/SP's} pregnancy history. {Have you/Has SP ever been pregnant? Please include (current pregnan
#> 1181   How many times {have you/has SP} been pregnant?  ({Again, be/Be} sure to count all {your/her} pregnancies including (current pre
#> 1182                                      Best age in months at date of examination for individuals under 85 years of age at screening.
#> 1183                                                     Best age in months at date of screening for individuals under 85 years of age.
#> 1184          Best age in years of the sample person at time of HH screening.  Individuals 85 and over are topcoded at 85 years of age.
#> 1185                                     On average, how many pills or doses of {PRODUCT NAME} {do you/does SP} take in a \nsingle day?
#> 1186                                                                On average, how many cigarettes {do you/does SP} now smoke per day?
#> 1187          {Have you/Has SP} used snuff, such as Skoal, Skoal Bandit, or Copenhagen at least 20 times in {your/his/her} entire life?
#> 1188   During the past 5 days {including today}, on how many days did {you/he/she} use snuff, such as Skoal, Skoal Bandits, or Copenhag
#> 1189                          Keratometric measure.  Dioptric power of the cornea averaged across meridians in the examinee's left eye.
#> 1190                   Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's left eye.
#> 1191                          Keratometric measure.  Dioptric power of the cornea averaged across meridians in the examinee's right eye
#> 1192                Keratometric measure.  Radius of corneal curvature (in mm) averaged across meridians in the examinee's right eye.  
#> 1193                                   I would like to ask you a few questions about your home. Does your home have an attached garage?
#> 1194                                       Do you store paints or fuels inside your home?  Include your basement (and attached garage.)
#> 1195              How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]
#> 1196   How much did {you/SP} weigh at age 25?  [If you don't know {your/his/her} exact weight, please make your best guess.]  If ( you 
#> 1197               How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 1198               How tall {were you/was SP} at age 25?  [If you don't know {your/his/her} exact height, please make your best guess.]
#> 1199                        How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 1200                        How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#> 1201                        How old {were you/was SP} then?  [If you don't know {your/his/her} exact age, please make your best guess.]
#>      Data.File.Name Begin.Year
#> 1             ACQ_L       2021
#> 2             ACQ_L       2021
#> 3             ACQ_L       2021
#> 4             ACQ_L       2021
#> 5             ALQ_L       2021
#> 6             ALQ_L       2021
#> 7             ALQ_L       2021
#> 8             ALQ_L       2021
#> 9             ALQ_L       2021
#> 10            DIQ_L       2021
#> 11           DEMO_L       2021
#> 12         DR1TOT_L       2021
#> 13         DR2TOT_L       2021
#> 14            FNQ_L       2021
#> 15            FNQ_L       2021
#> 16            FNQ_L       2021
#> 17            FNQ_L       2021
#> 18            FNQ_L       2021
#> 19            HIQ_L       2021
#> 20          KIQ_U_L       2021
#> 21          KIQ_U_L       2021
#> 22            RHQ_L       2021
#> 23           DEMO_L       2021
#> 24           DEMO_L       2021
#> 25           DEMO_L       2021
#> 26           DEMO_L       2021
#> 27         SMQFAM_L       2021
#> 28            ACQ_J       2017
#> 29            P_ACQ       2017
#> 30            ACQ_J       2017
#> 31            P_ACQ       2017
#> 32            ACQ_J       2017
#> 33            P_ACQ       2017
#> 34            ACQ_J       2017
#> 35            P_ACQ       2017
#> 36            ACQ_J       2017
#> 37            P_ACQ       2017
#> 38           DEMO_J       2017
#> 39           P_DEMO       2017
#> 40            ALQ_J       2017
#> 41            P_ALQ       2017
#> 42            ALQ_J       2017
#> 43            P_ALQ       2017
#> 44            ALQ_J       2017
#> 45            P_ALQ       2017
#> 46            ALQ_J       2017
#> 47            P_ALQ       2017
#> 48            ALQ_J       2017
#> 49            P_ALQ       2017
#> 50            ALQ_J       2017
#> 51            P_ALQ       2017
#> 52            AUQ_J       2017
#> 53            P_AUQ       2017
#> 54            AUQ_J       2017
#> 55            P_AUQ       2017
#> 56            AUQ_J       2017
#> 57            P_AUQ       2017
#> 58            CBQ_J       2017
#> 59         CBQPFC_J       2017
#> 60         CBQPFA_J       2017
#> 61         P_CBQPFC       2017
#> 62         P_CBQPFA       2017
#> 63         CBQPFC_J       2017
#> 64         CBQPFA_J       2017
#> 65         P_CBQPFC       2017
#> 66         P_CBQPFA       2017
#> 67         CBQPFC_J       2017
#> 68         CBQPFA_J       2017
#> 69         P_CBQPFC       2017
#> 70         P_CBQPFA       2017
#> 71         CBQPFA_J       2017
#> 72         P_CBQPFA       2017
#> 73         CBQPFC_J       2017
#> 74         CBQPFA_J       2017
#> 75         P_CBQPFC       2017
#> 76         P_CBQPFA       2017
#> 77         CBQPFC_J       2017
#> 78         CBQPFA_J       2017
#> 79         P_CBQPFC       2017
#> 80         P_CBQPFA       2017
#> 81         CBQPFC_J       2017
#> 82         CBQPFA_J       2017
#> 83         P_CBQPFC       2017
#> 84         P_CBQPFA       2017
#> 85         CBQPFC_J       2017
#> 86         CBQPFA_J       2017
#> 87         P_CBQPFC       2017
#> 88         P_CBQPFA       2017
#> 89         CBQPFC_J       2017
#> 90         CBQPFA_J       2017
#> 91         P_CBQPFC       2017
#> 92         P_CBQPFA       2017
#> 93         CBQPFC_J       2017
#> 94         CBQPFA_J       2017
#> 95         P_CBQPFC       2017
#> 96         P_CBQPFA       2017
#> 97         CBQPFC_J       2017
#> 98         CBQPFA_J       2017
#> 99         P_CBQPFC       2017
#> 100        P_CBQPFA       2017
#> 101        CBQPFC_J       2017
#> 102        CBQPFA_J       2017
#> 103        P_CBQPFC       2017
#> 104        P_CBQPFA       2017
#> 105           DBQ_J       2017
#> 106           P_DBQ       2017
#> 107           DBQ_J       2017
#> 108           P_DBQ       2017
#> 109           DBQ_J       2017
#> 110           P_DBQ       2017
#> 111        CBQPFC_J       2017
#> 112        CBQPFA_J       2017
#> 113        P_CBQPFC       2017
#> 114        P_CBQPFA       2017
#> 115        CBQPFC_J       2017
#> 116        CBQPFA_J       2017
#> 117        P_CBQPFC       2017
#> 118        P_CBQPFA       2017
#> 119           DIQ_J       2017
#> 120           P_DIQ       2017
#> 121           DIQ_J       2017
#> 122           P_DIQ       2017
#> 123          DEMO_J       2017
#> 124          DEMO_J       2017
#> 125          DEMO_J       2017
#> 126          DEMO_J       2017
#> 127        DR1TOT_J       2017
#> 128        P_DR1TOT       2017
#> 129        DR2TOT_J       2017
#> 130        P_DR2TOT       2017
#> 131          DEMO_J       2017
#> 132          P_DEMO       2017
#> 133           FSQ_J       2017
#> 134           P_FSQ       2017
#> 135           FSQ_J       2017
#> 136           P_FSQ       2017
#> 137           FSQ_J       2017
#> 138           P_FSQ       2017
#> 139           HIQ_J       2017
#> 140           HIQ_J       2017
#> 141           P_HIQ       2017
#> 142           INQ_J       2017
#> 143         KIQ_U_J       2017
#> 144         P_KIQ_U       2017
#> 145         KIQ_U_J       2017
#> 146         P_KIQ_U       2017
#> 147         KIQ_U_J       2017
#> 148         P_KIQ_U       2017
#> 149           MCQ_J       2017
#> 150           P_MCQ       2017
#> 151          DEMO_J       2017
#> 152          P_DEMO       2017
#> 153           OHQ_J       2017
#> 154           P_OHQ       2017
#> 155           OHQ_J       2017
#> 156           P_OHQ       2017
#> 157           OHQ_J       2017
#> 158           P_OHQ       2017
#> 159           OHQ_J       2017
#> 160           P_OHQ       2017
#> 161           OHQ_J       2017
#> 162           P_OHQ       2017
#> 163           OHQ_J       2017
#> 164           P_OHQ       2017
#> 165           OHQ_J       2017
#> 166           P_OHQ       2017
#> 167           OSQ_J       2017
#> 168           P_OSQ       2017
#> 169           OSQ_J       2017
#> 170           P_OSQ       2017
#> 171           OSQ_J       2017
#> 172           P_OSQ       2017
#> 173           OSQ_J       2017
#> 174           P_OSQ       2017
#> 175           OSQ_J       2017
#> 176           P_OSQ       2017
#> 177           OSQ_J       2017
#> 178           P_OSQ       2017
#> 179           OSQ_J       2017
#> 180           P_OSQ       2017
#> 181           OSQ_J       2017
#> 182           P_OSQ       2017
#> 183           OSQ_J       2017
#> 184           P_OSQ       2017
#> 185           OSQ_J       2017
#> 186           P_OSQ       2017
#> 187           OSQ_J       2017
#> 188           P_OSQ       2017
#> 189           OSQ_J       2017
#> 190           P_OSQ       2017
#> 191           OSQ_J       2017
#> 192           P_OSQ       2017
#> 193           OSQ_J       2017
#> 194           P_OSQ       2017
#> 195           OSQ_J       2017
#> 196           P_OSQ       2017
#> 197           OSQ_J       2017
#> 198           P_OSQ       2017
#> 199           OSQ_J       2017
#> 200           P_OSQ       2017
#> 201           OSQ_J       2017
#> 202           P_OSQ       2017
#> 203          PAQY_J       2017
#> 204          PAQY_J       2017
#> 205           RHQ_J       2017
#> 206           P_RHQ       2017
#> 207           RHQ_J       2017
#> 208           P_RHQ       2017
#> 209          DEMO_J       2017
#> 210          P_DEMO       2017
#> 211          DEMO_J       2017
#> 212          P_DEMO       2017
#> 213          DEMO_J       2017
#> 214          DEMO_J       2017
#> 215          P_DEMO       2017
#> 216          DEMO_J       2017
#> 217          P_DEMO       2017
#> 218        SMQFAM_J       2017
#> 219        P_SMQFAM       2017
#> 220        SMQFAM_J       2017
#> 221        SMQRTU_J       2017
#> 222        P_SMQRTU       2017
#> 223           VTQ_J       2017
#> 224           P_VTQ       2017
#> 225           VTQ_J       2017
#> 226           P_VTQ       2017
#> 227           WHQ_J       2017
#> 228           P_WHQ       2017
#> 229           WHQ_J       2017
#> 230           P_WHQ       2017
#> 231           WHQ_J       2017
#> 232           P_WHQ       2017
#> 233           ACQ_I       2015
#> 234           ACQ_I       2015
#> 235           ACQ_I       2015
#> 236           ACQ_I       2015
#> 237           ACQ_I       2015
#> 238          DEMO_I       2015
#> 239           ALQ_I       2015
#> 240           ALQ_I       2015
#> 241           ALQ_I       2015
#> 242           ALQ_I       2015
#> 243           ALQ_I       2015
#> 244           ALQ_I       2015
#> 245           AUQ_I       2015
#> 246           BMX_I       2015
#> 247           CBQ_I       2015
#> 248           DBQ_I       2015
#> 249           DBQ_I       2015
#> 250           DBQ_I       2015
#> 251           DIQ_I       2015
#> 252           DIQ_I       2015
#> 253          DEMO_I       2015
#> 254          DEMO_I       2015
#> 255          DEMO_I       2015
#> 256          DEMO_I       2015
#> 257        DR1TOT_I       2015
#> 258        DR2TOT_I       2015
#> 259          DEMO_I       2015
#> 260           FSQ_I       2015
#> 261           FSQ_I       2015
#> 262           FSQ_I       2015
#> 263           HIQ_I       2015
#> 264           HIQ_I       2015
#> 265           INQ_I       2015
#> 266         KIQ_U_I       2015
#> 267         KIQ_U_I       2015
#> 268         KIQ_U_I       2015
#> 269         FLDEP_I       2015
#> 270         FLDEW_I       2015
#> 271           MCQ_I       2015
#> 272           MCQ_I       2015
#> 273          DEMO_I       2015
#> 274           OCQ_I       2015
#> 275           OCQ_I       2015
#> 276           OHQ_I       2015
#> 277           OHQ_I       2015
#> 278           OHQ_I       2015
#> 279           OHQ_I       2015
#> 280           OHQ_I       2015
#> 281           OHQ_I       2015
#> 282           OHQ_I       2015
#> 283           PAQ_I       2015
#> 284           PAQ_I       2015
#> 285           PAQ_I       2015
#> 286           PAQ_I       2015
#> 287           PAQ_I       2015
#> 288           RHQ_I       2015
#> 289           RHQ_I       2015
#> 290          DEMO_I       2015
#> 291          DEMO_I       2015
#> 292        PCBPOL_I       2015
#> 293        PSTPOL_I       2015
#> 294        BFRPOL_I       2015
#> 295        DOXPOL_I       2015
#> 296          DEMO_I       2015
#> 297          DEMO_I       2015
#> 298          DEMO_I       2015
#> 299        SMQFAM_I       2015
#> 300        SMQFAM_I       2015
#> 301        SMQRTU_I       2015
#> 302           VTQ_I       2015
#> 303           VTQ_I       2015
#> 304           WHQ_I       2015
#> 305           WHQ_I       2015
#> 306           WHQ_I       2015
#> 307           ACQ_H       2013
#> 308           ACQ_H       2013
#> 309           ACQ_H       2013
#> 310           ACQ_H       2013
#> 311           ACQ_H       2013
#> 312          DEMO_H       2013
#> 313           ALQ_H       2013
#> 314           ALQ_H       2013
#> 315           ALQ_H       2013
#> 316           ALQ_H       2013
#> 317           ALQ_H       2013
#> 318           ALQ_H       2013
#> 319           BMX_H       2013
#> 320           CFQ_H       2013
#> 321           DBQ_H       2013
#> 322           DBQ_H       2013
#> 323           DBQ_H       2013
#> 324           DIQ_H       2013
#> 325           DIQ_H       2013
#> 326          DEMO_H       2013
#> 327          DEMO_H       2013
#> 328          DEMO_H       2013
#> 329          DEMO_H       2013
#> 330        DR1TOT_H       2013
#> 331        DR2TOT_H       2013
#> 332         DXXT4_H       2013
#> 333         DXXT5_H       2013
#> 334         DXXT6_H       2013
#> 335         DXXT7_H       2013
#> 336         DXXT8_H       2013
#> 337         DXXT9_H       2013
#> 338        DXXT10_H       2013
#> 339        DXXT11_H       2013
#> 340        DXXT12_H       2013
#> 341         DXXL1_H       2013
#> 342         DXXL2_H       2013
#> 343         DXXL3_H       2013
#> 344         DXXL4_H       2013
#> 345         DXXT4_H       2013
#> 346         DXXT5_H       2013
#> 347         DXXT6_H       2013
#> 348         DXXT7_H       2013
#> 349         DXXT8_H       2013
#> 350         DXXT9_H       2013
#> 351        DXXT10_H       2013
#> 352        DXXT11_H       2013
#> 353        DXXT12_H       2013
#> 354         DXXL1_H       2013
#> 355         DXXL2_H       2013
#> 356         DXXL3_H       2013
#> 357         DXXL4_H       2013
#> 358        DXXFRX_H       2013
#> 359         DXXT4_H       2013
#> 360         DXXT5_H       2013
#> 361         DXXT6_H       2013
#> 362         DXXT7_H       2013
#> 363         DXXT8_H       2013
#> 364         DXXT9_H       2013
#> 365        DXXT10_H       2013
#> 366        DXXT11_H       2013
#> 367        DXXT12_H       2013
#> 368         DXXL1_H       2013
#> 369         DXXL2_H       2013
#> 370         DXXL3_H       2013
#> 371         DXXL4_H       2013
#> 372          DEMO_H       2013
#> 373           FSQ_H       2013
#> 374           HIQ_H       2013
#> 375           HIQ_H       2013
#> 376           INQ_H       2013
#> 377         KIQ_U_H       2013
#> 378         KIQ_U_H       2013
#> 379         KIQ_U_H       2013
#> 380         FLDEP_H       2013
#> 381         FLDEW_H       2013
#> 382           MCQ_H       2013
#> 383           MCQ_H       2013
#> 384          DEMO_H       2013
#> 385           OCQ_H       2013
#> 386           OCQ_H       2013
#> 387           OHQ_H       2013
#> 388           OHQ_H       2013
#> 389           OHQ_H       2013
#> 390           OHQ_H       2013
#> 391           OHQ_H       2013
#> 392           OHQ_H       2013
#> 393           OHQ_H       2013
#> 394           OSQ_H       2013
#> 395           OSQ_H       2013
#> 396           OSQ_H       2013
#> 397           OSQ_H       2013
#> 398           OSQ_H       2013
#> 399           OSQ_H       2013
#> 400           OSQ_H       2013
#> 401           OSQ_H       2013
#> 402           OSQ_H       2013
#> 403           OSQ_H       2013
#> 404           OSQ_H       2013
#> 405           OSQ_H       2013
#> 406           OSQ_H       2013
#> 407           OSQ_H       2013
#> 408           OSQ_H       2013
#> 409           PAQ_H       2013
#> 410           PAQ_H       2013
#> 411           PAQ_H       2013
#> 412           PAQ_H       2013
#> 413           PAQ_H       2013
#> 414           RHQ_H       2013
#> 415           RHQ_H       2013
#> 416          DEMO_H       2013
#> 417          DEMO_H       2013
#> 418        PCBPOL_H       2013
#> 419        BFRPOL_H       2013
#> 420        PSTPOL_H       2013
#> 421        DOXPOL_H       2013
#> 422          DEMO_H       2013
#> 423          DEMO_H       2013
#> 424          DEMO_H       2013
#> 425        SMQFAM_H       2013
#> 426        SMQFAM_H       2013
#> 427        SMQRTU_H       2013
#> 428        VOCWBS_H       2013
#> 429           VTQ_H       2013
#> 430        VOCWBS_H       2013
#> 431           VTQ_H       2013
#> 432           WHQ_H       2013
#> 433           WHQ_H       2013
#> 434           WHQ_H       2013
#> 435           ACQ_G       2011
#> 436           ACQ_G       2011
#> 437           ACQ_G       2011
#> 438           ACQ_G       2011
#> 439           ACQ_G       2011
#> 440          DEMO_G       2011
#> 441           ALQ_G       2011
#> 442           ALQ_G       2011
#> 443           ALQ_G       2011
#> 444           ALQ_G       2011
#> 445           ALQ_G       2011
#> 446           ALQ_G       2011
#> 447           ALQ_G       2011
#> 448           AUQ_G       2011
#> 449           DBQ_G       2011
#> 450           CFQ_G       2011
#> 451           DBQ_G       2011
#> 452           DBQ_G       2011
#> 453           DBQ_G       2011
#> 454           DIQ_G       2011
#> 455           DIQ_G       2011
#> 456          DEMO_G       2011
#> 457          DEMO_G       2011
#> 458          DEMO_G       2011
#> 459          DEMO_G       2011
#> 460           ENX_G       2011
#> 461          DEMO_G       2011
#> 462           FSQ_G       2011
#> 463           HCQ_G       2011
#> 464           HIQ_G       2011
#> 465           HIQ_G       2011
#> 466           INQ_G       2011
#> 467         KIQ_U_G       2011
#> 468         KIQ_U_G       2011
#> 469         KIQ_U_G       2011
#> 470           MCQ_G       2011
#> 471           MCQ_G       2011
#> 472          DEMO_G       2011
#> 473           OCQ_G       2011
#> 474           OCQ_G       2011
#> 475           PAQ_G       2011
#> 476           PAQ_G       2011
#> 477           RDQ_G       2011
#> 478           RHQ_G       2011
#> 479           RHQ_G       2011
#> 480          DEMO_G       2011
#> 481          DEMO_G       2011
#> 482        PCBPOL_G       2011
#> 483        PSTPOL_G       2011
#> 484        BFRPOL_G       2011
#> 485        DOXPOL_G       2011
#> 486          DEMO_G       2011
#> 487          DEMO_G       2011
#> 488          DEMO_G       2011
#> 489          DEMO_G       2011
#> 490        SMQRTU_G       2011
#> 491           VTQ_G       2011
#> 492           VTQ_G       2011
#> 493           WHQ_G       2011
#> 494           WHQ_G       2011
#> 495           WHQ_G       2011
#> 496           ACQ_F       2009
#> 497           ACQ_F       2009
#> 498           ACQ_F       2009
#> 499           ACQ_F       2009
#> 500          DEMO_F       2009
#> 501           ALQ_F       2009
#> 502           ALQ_F       2009
#> 503           ALQ_F       2009
#> 504           ALQ_F       2009
#> 505           ALQ_F       2009
#> 506           ALQ_F       2009
#> 507           ARQ_F       2009
#> 508           ARQ_F       2009
#> 509           ARQ_F       2009
#> 510           ARQ_F       2009
#> 511           ARQ_F       2009
#> 512           ARQ_F       2009
#> 513           ARQ_F       2009
#> 514           ARQ_F       2009
#> 515           ARQ_F       2009
#> 516           ARQ_F       2009
#> 517           ARQ_F       2009
#> 518           BHQ_F       2009
#> 519           BHQ_F       2009
#> 520           BHQ_F       2009
#> 521           BHQ_F       2009
#> 522        CBQPFA_F       2009
#> 523        CBQPFA_F       2009
#> 524        CBQPFA_F       2009
#> 525        CBQPFA_F       2009
#> 526        CBQPFA_F       2009
#> 527        CBQPFA_F       2009
#> 528        CBQPFA_F       2009
#> 529        CBQPFC_F       2009
#> 530        CBQPFA_F       2009
#> 531        CBQPFC_F       2009
#> 532        CBQPFA_F       2009
#> 533        CBQPFC_F       2009
#> 534        CBQPFA_F       2009
#> 535        CBQPFC_F       2009
#> 536        CBQPFC_F       2009
#> 537        CBQPFC_F       2009
#> 538        CBQPFA_F       2009
#> 539        CBQPFA_F       2009
#> 540        CBQPFA_F       2009
#> 541        CBQPFA_F       2009
#> 542        CBQPFC_F       2009
#> 543           DBQ_F       2009
#> 544           DBQ_F       2009
#> 545           DBQ_F       2009
#> 546        CBQPFA_F       2009
#> 547        CBQPFC_F       2009
#> 548        CBQPFA_F       2009
#> 549        CBQPFC_F       2009
#> 550           DIQ_F       2009
#> 551          DEMO_F       2009
#> 552           DTQ_F       2009
#> 553           ENX_F       2009
#> 554          DEMO_F       2009
#> 555           FSQ_F       2009
#> 556           HCQ_F       2009
#> 557           HIQ_F       2009
#> 558           HIQ_F       2009
#> 559           INQ_F       2009
#> 560         KIQ_U_F       2009
#> 561         KIQ_U_F       2009
#> 562         KIQ_U_F       2009
#> 563           MCQ_F       2009
#> 564           MCQ_F       2009
#> 565          DEMO_F       2009
#> 566           OCQ_F       2009
#> 567           OCQ_F       2009
#> 568           OSQ_F       2009
#> 569           OSQ_F       2009
#> 570           OSQ_F       2009
#> 571           OSQ_F       2009
#> 572           OSQ_F       2009
#> 573           OSQ_F       2009
#> 574           OSQ_F       2009
#> 575           OSQ_F       2009
#> 576           OSQ_F       2009
#> 577           OSQ_F       2009
#> 578           OSQ_F       2009
#> 579           OSQ_F       2009
#> 580           OSQ_F       2009
#> 581           OSQ_F       2009
#> 582           OSQ_F       2009
#> 583           OSQ_F       2009
#> 584           OSQ_F       2009
#> 585           PAQ_F       2009
#> 586           PAQ_F       2009
#> 587           RDQ_F       2009
#> 588           RHQ_F       2009
#> 589           RHQ_F       2009
#> 590          DEMO_F       2009
#> 591          DEMO_F       2009
#> 592          DEMO_F       2009
#> 593        DOXPOL_F       2009
#> 594        PSTPOL_F       2009
#> 595        BFRPOL_F       2009
#> 596        PCBPOL_F       2009
#> 597          DEMO_F       2009
#> 598          DEMO_F       2009
#> 599        SMQRTU_F       2009
#> 600           VTQ_F       2009
#> 601           VTQ_F       2009
#> 602           WHQ_F       2009
#> 603           WHQ_F       2009
#> 604           WHQ_F       2009
#> 605           ACQ_E       2007
#> 606           ACQ_E       2007
#> 607           ACQ_E       2007
#> 608           ACQ_E       2007
#> 609          DEMO_E       2007
#> 610           ALQ_E       2007
#> 611           ALQ_E       2007
#> 612           ALQ_E       2007
#> 613           ALQ_E       2007
#> 614           ALQ_E       2007
#> 615           ALQ_E       2007
#> 616           BHQ_E       2007
#> 617           BHQ_E       2007
#> 618           BHQ_E       2007
#> 619           BHQ_E       2007
#> 620        CBQPFA_E       2007
#> 621        CBQPFA_E       2007
#> 622        CBQPFA_E       2007
#> 623        CBQPFA_E       2007
#> 624        CBQPFA_E       2007
#> 625        CBQPFA_E       2007
#> 626        CBQPFC_E       2007
#> 627        CBQPFA_E       2007
#> 628        CBQPFC_E       2007
#> 629        CBQPFA_E       2007
#> 630        CBQPFC_E       2007
#> 631        CBQPFA_E       2007
#> 632        CBQPFA_E       2007
#> 633        CBQPFC_E       2007
#> 634        CBQPFA_E       2007
#> 635        CBQPFC_E       2007
#> 636        CBQPFA_E       2007
#> 637        CBQPFC_E       2007
#> 638        CBQPFA_E       2007
#> 639        CBQPFC_E       2007
#> 640           DBQ_E       2007
#> 641           DBQ_E       2007
#> 642           DBQ_E       2007
#> 643        CBQPFA_E       2007
#> 644        CBQPFC_E       2007
#> 645        CBQPFA_E       2007
#> 646        CBQPFC_E       2007
#> 647           DIQ_E       2007
#> 648           DIQ_E       2007
#> 649          DEMO_E       2007
#> 650           ENX_E       2007
#> 651          DEMO_E       2007
#> 652           FSQ_E       2007
#> 653           HCQ_E       2007
#> 654           HIQ_E       2007
#> 655           HIQ_E       2007
#> 656           INQ_E       2007
#> 657         KIQ_U_E       2007
#> 658         KIQ_U_E       2007
#> 659         KIQ_U_E       2007
#> 660           MCQ_E       2007
#> 661           MCQ_E       2007
#> 662          DEMO_E       2007
#> 663           OCQ_E       2007
#> 664           OCQ_E       2007
#> 665        OPXRET_E       2007
#> 666        OPXRET_E       2007
#> 667        OPXRET_E       2007
#> 668        OPXRET_E       2007
#> 669        OPXRET_E       2007
#> 670        OPXRET_E       2007
#> 671        OPXRET_E       2007
#> 672        OPXRET_E       2007
#> 673        OPXRET_E       2007
#> 674        OPXRET_E       2007
#> 675        OPXRET_E       2007
#> 676        OPXRET_E       2007
#> 677        OPXRET_E       2007
#> 678        OPXRET_E       2007
#> 679        OPXRET_E       2007
#> 680        OPXRET_E       2007
#> 681        OPXRET_E       2007
#> 682        OPXRET_E       2007
#> 683        OPXRET_E       2007
#> 684        OPXRET_E       2007
#> 685        OPXRET_E       2007
#> 686        OPXRET_E       2007
#> 687        OPXRET_E       2007
#> 688        OPXRET_E       2007
#> 689        OPXRET_E       2007
#> 690        OPXRET_E       2007
#> 691        OPXRET_E       2007
#> 692        OPXRET_E       2007
#> 693        OPXRET_E       2007
#> 694        OPXRET_E       2007
#> 695        OPXRET_E       2007
#> 696        OPXRET_E       2007
#> 697        OPXRET_E       2007
#> 698        OPXRET_E       2007
#> 699        OPXRET_E       2007
#> 700        OPXRET_E       2007
#> 701        OPXRET_E       2007
#> 702        OPXRET_E       2007
#> 703           OSQ_E       2007
#> 704           OSQ_E       2007
#> 705           OSQ_E       2007
#> 706           OSQ_E       2007
#> 707           OSQ_E       2007
#> 708           OSQ_E       2007
#> 709           OSQ_E       2007
#> 710           OSQ_E       2007
#> 711           OSQ_E       2007
#> 712           OSQ_E       2007
#> 713           OSQ_E       2007
#> 714           OSQ_E       2007
#> 715           OSQ_E       2007
#> 716           OSQ_E       2007
#> 717           OSQ_E       2007
#> 718           OSQ_E       2007
#> 719           OSQ_E       2007
#> 720           OSQ_E       2007
#> 721           OSQ_E       2007
#> 722           PAQ_E       2007
#> 723           PAQ_E       2007
#> 724           PFQ_E       2007
#> 725           RDQ_E       2007
#> 726           RHQ_E       2007
#> 727           RHQ_E       2007
#> 728          DEMO_E       2007
#> 729          DEMO_E       2007
#> 730          DEMO_E       2007
#> 731        BFRPOL_E       2007
#> 732        PCBPOL_E       2007
#> 733        PSTPOL_E       2007
#> 734        DOXPOL_E       2007
#> 735          DEMO_E       2007
#> 736          DEMO_E       2007
#> 737        SMQRTU_E       2007
#> 738           VIQ_E       2007
#> 739           VIQ_E       2007
#> 740           VIX_E       2007
#> 741           VIX_E       2007
#> 742           VIX_E       2007
#> 743           VIX_E       2007
#> 744           VOC_E       2007
#> 745         VOCWB_E       2007
#> 746        VOCMWB_E       2007
#> 747           VOC_E       2007
#> 748         VOCWB_E       2007
#> 749        VOCMWB_E       2007
#> 750           WHQ_E       2007
#> 751           WHQ_E       2007
#> 752           WHQ_E       2007
#> 753           ACQ_D       2005
#> 754           ACQ_D       2005
#> 755           ACQ_D       2005
#> 756           ACQ_D       2005
#> 757           AGQ_D       2005
#> 758          DEMO_D       2005
#> 759           ALQ_D       2005
#> 760           ALQ_D       2005
#> 761           ALQ_D       2005
#> 762           ALQ_D       2005
#> 763           ALQ_D       2005
#> 764           ALQ_D       2005
#> 765           BHQ_D       2005
#> 766           BHQ_D       2005
#> 767           BHQ_D       2005
#> 768           BHQ_D       2005
#> 769           DBQ_D       2005
#> 770           DBQ_D       2005
#> 771           DBQ_D       2005
#> 772           DBQ_D       2005
#> 773           DBQ_D       2005
#> 774           DIQ_D       2005
#> 775           DIQ_D       2005
#> 776          DEMO_D       2005
#> 777          DSQ2_D       2005
#> 778        FFQRAW_D       2005
#> 779        FFQRAW_D       2005
#> 780        FFQRAW_D       2005
#> 781        FFQRAW_D       2005
#> 782        FFQRAW_D       2005
#> 783        FFQRAW_D       2005
#> 784        FFQRAW_D       2005
#> 785        FFQRAW_D       2005
#> 786        FFQRAW_D       2005
#> 787        FFQRAW_D       2005
#> 788        FFQRAW_D       2005
#> 789        FFQRAW_D       2005
#> 790        FFQRAW_D       2005
#> 791        FFQRAW_D       2005
#> 792        FFQRAW_D       2005
#> 793          DEMO_D       2005
#> 794           HCQ_D       2005
#> 795           HIQ_D       2005
#> 796           HIQ_D       2005
#> 797         KIQ_U_D       2005
#> 798         KIQ_U_D       2005
#> 799         KIQ_U_D       2005
#> 800           MCQ_D       2005
#> 801           MCQ_D       2005
#> 802          DEMO_D       2005
#> 803           OCQ_D       2005
#> 804        OPXRET_D       2005
#> 805        OPXRET_D       2005
#> 806        OPXRET_D       2005
#> 807        OPXRET_D       2005
#> 808        OPXRET_D       2005
#> 809        OPXRET_D       2005
#> 810        OPXRET_D       2005
#> 811        OPXRET_D       2005
#> 812        OPXRET_D       2005
#> 813        OPXRET_D       2005
#> 814        OPXRET_D       2005
#> 815        OPXRET_D       2005
#> 816        OPXRET_D       2005
#> 817        OPXRET_D       2005
#> 818        OPXRET_D       2005
#> 819        OPXRET_D       2005
#> 820        OPXRET_D       2005
#> 821        OPXRET_D       2005
#> 822        OPXRET_D       2005
#> 823        OPXRET_D       2005
#> 824        OPXRET_D       2005
#> 825        OPXRET_D       2005
#> 826        OPXRET_D       2005
#> 827        OPXRET_D       2005
#> 828        OPXRET_D       2005
#> 829        OPXRET_D       2005
#> 830        OPXRET_D       2005
#> 831        OPXRET_D       2005
#> 832        OPXRET_D       2005
#> 833        OPXRET_D       2005
#> 834        OPXRET_D       2005
#> 835        OPXRET_D       2005
#> 836        OPXRET_D       2005
#> 837        OPXRET_D       2005
#> 838        OPXRET_D       2005
#> 839        OPXRET_D       2005
#> 840        OPXRET_D       2005
#> 841        OPXRET_D       2005
#> 842           OSQ_D       2005
#> 843           OSQ_D       2005
#> 844           OSQ_D       2005
#> 845           OSQ_D       2005
#> 846           OSQ_D       2005
#> 847           OSQ_D       2005
#> 848           OSQ_D       2005
#> 849           OSQ_D       2005
#> 850           OSQ_D       2005
#> 851           OSQ_D       2005
#> 852           OSQ_D       2005
#> 853           OSQ_D       2005
#> 854           OSQ_D       2005
#> 855           OSQ_D       2005
#> 856           OSQ_D       2005
#> 857           OSQ_D       2005
#> 858           OSQ_D       2005
#> 859           OSQ_D       2005
#> 860           OSQ_D       2005
#> 861           OSQ_D       2005
#> 862           OSQ_D       2005
#> 863           PAQ_D       2005
#> 864           PAQ_D       2005
#> 865        PAQIAF_D       2005
#> 866           PAQ_D       2005
#> 867           PFQ_D       2005
#> 868           PSQ_D       2005
#> 869           PSQ_D       2005
#> 870           PSQ_D       2005
#> 871           RDQ_D       2005
#> 872           RHQ_D       2005
#> 873           RHQ_D       2005
#> 874          DEMO_D       2005
#> 875          DEMO_D       2005
#> 876          DEMO_D       2005
#> 877        DOXPOL_D       2005
#> 878        BFRPOL_D       2005
#> 879        PCBPOL_D       2005
#> 880        PSTPOL_D       2005
#> 881          DEMO_D       2005
#> 882           SMQ_D       2005
#> 883        SMQRTU_D       2005
#> 884           VIQ_D       2005
#> 885           VIQ_D       2005
#> 886           VIX_D       2005
#> 887           VIX_D       2005
#> 888           VIX_D       2005
#> 889           VIX_D       2005
#> 890           VOC_D       2005
#> 891           VOC_D       2005
#> 892         VOCWB_D       2005
#> 893           WHQ_D       2005
#> 894           WHQ_D       2005
#> 895           WHQ_D       2005
#> 896           ACQ_C       2003
#> 897           ACQ_C       2003
#> 898           ACQ_C       2003
#> 899           ACQ_C       2003
#> 900           ACQ_C       2003
#> 901           ACQ_C       2003
#> 902           ACQ_C       2003
#> 903           ACQ_C       2003
#> 904          DEMO_C       2003
#> 905           ALQ_C       2003
#> 906           ALQ_C       2003
#> 907           ALQ_C       2003
#> 908           ALQ_C       2003
#> 909           ALQ_C       2003
#> 910           ALQ_C       2003
#> 911           AUQ_C       2003
#> 912           AUQ_C       2003
#> 913        CIQDEP_C       2003
#> 914        CIQDEP_C       2003
#> 915        CIQGAD_C       2003
#> 916        CIQGAD_C       2003
#> 917        CIQPAN_C       2003
#> 918        CIQPAN_C       2003
#> 919        CIQPAN_C       2003
#> 920        CIQPAN_C       2003
#> 921        CIQPAN_C       2003
#> 922           CVX_C       2003
#> 923           CVX_C       2003
#> 924           CVX_C       2003
#> 925           CVX_C       2003
#> 926           CVX_C       2003
#> 927           CVX_C       2003
#> 928           CVX_C       2003
#> 929           CVX_C       2003
#> 930           CVX_C       2003
#> 931           CVX_C       2003
#> 932           CVX_C       2003
#> 933           CVX_C       2003
#> 934           CVX_C       2003
#> 935           CVX_C       2003
#> 936           CVX_C       2003
#> 937           CVX_C       2003
#> 938           CVX_C       2003
#> 939           CVX_C       2003
#> 940           DBQ_C       2003
#> 941           DBQ_C       2003
#> 942           DBQ_C       2003
#> 943           DBQ_C       2003
#> 944           DEX_C       2003
#> 945           DEX_C       2003
#> 946           DEX_C       2003
#> 947           DEX_C       2003
#> 948           DEX_C       2003
#> 949           DEX_C       2003
#> 950           DEX_C       2003
#> 951           DEX_C       2003
#> 952           DIQ_C       2003
#> 953          DEMO_C       2003
#> 954          DSQ2_C       2003
#> 955        FFQRAW_C       2003
#> 956        FFQRAW_C       2003
#> 957        FFQRAW_C       2003
#> 958        FFQRAW_C       2003
#> 959        FFQRAW_C       2003
#> 960        FFQRAW_C       2003
#> 961        FFQRAW_C       2003
#> 962        FFQRAW_C       2003
#> 963        FFQRAW_C       2003
#> 964        FFQRAW_C       2003
#> 965        FFQRAW_C       2003
#> 966        FFQRAW_C       2003
#> 967        FFQRAW_C       2003
#> 968        FFQRAW_C       2003
#> 969        FFQRAW_C       2003
#> 970          DEMO_C       2003
#> 971           HCQ_C       2003
#> 972           HIQ_C       2003
#> 973           HIQ_C       2003
#> 974           HOQ_C       2003
#> 975           HOQ_C       2003
#> 976         KIQ_U_C       2003
#> 977         KIQ_U_C       2003
#> 978         KIQ_U_C       2003
#> 979           MCQ_C       2003
#> 980           MCQ_C       2003
#> 981           MCQ_C       2003
#> 982          DEMO_C       2003
#> 983           OCQ_C       2003
#> 984           OCQ_C       2003
#> 985           OCQ_C       2003
#> 986           PAQ_C       2003
#> 987           PAQ_C       2003
#> 988        PAQIAF_C       2003
#> 989           PAQ_C       2003
#> 990           PFQ_C       2003
#> 991           PSQ_C       2003
#> 992           PSQ_C       2003
#> 993           PSQ_C       2003
#> 994           RDQ_C       2003
#> 995           RHQ_C       2003
#> 996           RHQ_C       2003
#> 997          DEMO_C       2003
#> 998          DEMO_C       2003
#> 999          DEMO_C       2003
#> 1000       RXQANA_C       2003
#> 1001         DEMO_C       2003
#> 1002          SMQ_C       2003
#> 1003          SMQ_C       2003
#> 1004       SMQMEC_C       2003
#> 1005          VIX_C       2003
#> 1006          VIX_C       2003
#> 1007          VIX_C       2003
#> 1008          VIX_C       2003
#> 1009       L04VOC_C       2003
#> 1010          WHQ_C       2003
#> 1011          WHQ_C       2003
#> 1012          WHQ_C       2003
#> 1013          ACQ_B       2001
#> 1014          ACQ_B       2001
#> 1015          ACQ_B       2001
#> 1016          ACQ_B       2001
#> 1017          ACQ_B       2001
#> 1018          ACQ_B       2001
#> 1019          ACQ_B       2001
#> 1020          ACQ_B       2001
#> 1021          ALQ_B       2001
#> 1022          ALQ_B       2001
#> 1023          ALQ_B       2001
#> 1024          ALQ_B       2001
#> 1025          ALQ_B       2001
#> 1026          ALQ_B       2001
#> 1027          AUQ_B       2001
#> 1028          AUQ_B       2001
#> 1029          BPX_B       2001
#> 1030          BPX_B       2001
#> 1031       CIQDEP_B       2001
#> 1032       CIQDEP_B       2001
#> 1033       CIQGAD_B       2001
#> 1034       CIQGAD_B       2001
#> 1035       CIQPAN_B       2001
#> 1036       CIQPAN_B       2001
#> 1037       CIQPAN_B       2001
#> 1038       CIQPAN_B       2001
#> 1039       CIQPAN_B       2001
#> 1040          CVX_B       2001
#> 1041          CVX_B       2001
#> 1042          CVX_B       2001
#> 1043          CVX_B       2001
#> 1044          CVX_B       2001
#> 1045          CVX_B       2001
#> 1046          CVX_B       2001
#> 1047          CVX_B       2001
#> 1048          CVX_B       2001
#> 1049          CVX_B       2001
#> 1050          CVX_B       2001
#> 1051          CVX_B       2001
#> 1052          CVX_B       2001
#> 1053          CVX_B       2001
#> 1054          CVX_B       2001
#> 1055          CVX_B       2001
#> 1056          CVX_B       2001
#> 1057          CVX_B       2001
#> 1058          DBQ_B       2001
#> 1059          DBQ_B       2001
#> 1060          DBQ_B       2001
#> 1061          DBQ_B       2001
#> 1062          DIQ_B       2001
#> 1063         DEMO_B       2001
#> 1064         DSQ2_B       2001
#> 1065          HCQ_B       2001
#> 1066          HIQ_B       2001
#> 1067          HIQ_B       2001
#> 1068          HOQ_B       2001
#> 1069          HOQ_B       2001
#> 1070        KIQ_U_B       2001
#> 1071        KIQ_U_B       2001
#> 1072        KIQ_U_B       2001
#> 1073          MCQ_B       2001
#> 1074          MCQ_B       2001
#> 1075          MCQ_B       2001
#> 1076          MSX_B       2001
#> 1077          OCQ_B       2001
#> 1078          OCQ_B       2001
#> 1079          OCQ_B       2001
#> 1080          PAQ_B       2001
#> 1081          PAQ_B       2001
#> 1082       PAQIAF_B       2001
#> 1083          PAQ_B       2001
#> 1084       PFC_Pool       2001
#> 1085          PFQ_B       2001
#> 1086          RDQ_B       2001
#> 1087          RHQ_B       2001
#> 1088          RHQ_B       2001
#> 1089         DEMO_B       2001
#> 1090         DEMO_B       2001
#> 1091         DEMO_B       2001
#> 1092        SSBFR_B       2001
#> 1093        SSPCB_B       2001
#> 1094        SSPST_B       2001
#> 1095       RXQANA_B       2001
#> 1096          SMQ_B       2001
#> 1097          SMQ_B       2001
#> 1098       SMQMEC_B       2001
#> 1099          VIX_B       2001
#> 1100          VIX_B       2001
#> 1101          VIX_B       2001
#> 1102          VIX_B       2001
#> 1103          WHQ_B       2001
#> 1104          WHQ_B       2001
#> 1105          WHQ_B       2001
#> 1106            ACQ       1999
#> 1107            ACQ       1999
#> 1108            ACQ       1999
#> 1109            ACQ       1999
#> 1110            ACQ       1999
#> 1111            ACQ       1999
#> 1112            ACQ       1999
#> 1113            ACQ       1999
#> 1114            DBQ       1999
#> 1115            ALQ       1999
#> 1116            ALQ       1999
#> 1117            ALQ       1999
#> 1118            ALQ       1999
#> 1119            ALQ       1999
#> 1120            ALQ       1999
#> 1121            AUQ       1999
#> 1122            AUQ       1999
#> 1123            BPX       1999
#> 1124            BPX       1999
#> 1125        CIQMDEP       1999
#> 1126        CIQMDEP       1999
#> 1127         CIQGAD       1999
#> 1128         CIQGAD       1999
#> 1129       CIQPANIC       1999
#> 1130       CIQPANIC       1999
#> 1131       CIQPANIC       1999
#> 1132       CIQPANIC       1999
#> 1133       CIQPANIC       1999
#> 1134            CVX       1999
#> 1135            CVX       1999
#> 1136            CVX       1999
#> 1137            CVX       1999
#> 1138            CVX       1999
#> 1139            CVX       1999
#> 1140            CVX       1999
#> 1141            CVX       1999
#> 1142            CVX       1999
#> 1143            CVX       1999
#> 1144            CVX       1999
#> 1145            CVX       1999
#> 1146            CVX       1999
#> 1147            CVX       1999
#> 1148            CVX       1999
#> 1149            CVX       1999
#> 1150            CVX       1999
#> 1151            CVX       1999
#> 1152            DBQ       1999
#> 1153            DBQ       1999
#> 1154            DBQ       1999
#> 1155            DBQ       1999
#> 1156            DBQ       1999
#> 1157            DBQ       1999
#> 1158            DBQ       1999
#> 1159            DBQ       1999
#> 1160            DBQ       1999
#> 1161            DIQ       1999
#> 1162           DEMO       1999
#> 1163       DSQFILE2       1999
#> 1164            HIQ       1999
#> 1165            HIQ       1999
#> 1166            HOQ       1999
#> 1167            HOQ       1999
#> 1168            MCQ       1999
#> 1169            MCQ       1999
#> 1170            MCQ       1999
#> 1171            MSX       1999
#> 1172            OCQ       1999
#> 1173            OCQ       1999
#> 1174            OCQ       1999
#> 1175            OCQ       1999
#> 1176         PAQIAF       1999
#> 1177            PAQ       1999
#> 1178            PFQ       1999
#> 1179            RDQ       1999
#> 1180            RHQ       1999
#> 1181            RHQ       1999
#> 1182           DEMO       1999
#> 1183           DEMO       1999
#> 1184           DEMO       1999
#> 1185        RXQ_ANA       1999
#> 1186            SMQ       1999
#> 1187            SMQ       1999
#> 1188         SMQMEC       1999
#> 1189            VIX       1999
#> 1190            VIX       1999
#> 1191            VIX       1999
#> 1192            VIX       1999
#> 1193          LAB21       1999
#> 1194          LAB21       1999
#> 1195            WHQ       1999
#> 1196            WHQ       1999
#> 1197            WHQ       1999
#> 1198            WHQ       1999
#> 1199            WHQ       1999
#> 1200            WHQ       1999
#> 1201            WHQ       1999

# Handles special characters safely
term_search("weight (kg)")
#> No matches found
#> No NHANES variables found matching: 'weight (kg)'
#> [1] Variable.Name        Variable.Description Data.File.Name      
#> [4] Begin.Year          
#> <0 rows> (or 0-length row.names)
```
