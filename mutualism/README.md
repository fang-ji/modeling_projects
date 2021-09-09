## Background
Many plants cannot survive without their insect pollinators; understanding which particular mechanism keeps the interaction between plants and pollinators mutualistic is crutial for maintaining biodiversity. In some systems (such as yucca - yucca moth, senita cactus - senita moth), plants benefit from pollination but there are costs through the consumption of seeds by the pollinators, while the insects benefits from seed resources. The costs to the insects is through punishment should the insects not pollinate enough flowers or lay too many eggs. This project focuses on the case of random-punishment strategy where plants randomly drop their flowers and developing fruits to prevent cheating when insect activity is high. A series of stage-structured models are used to examine how and under what ecological conditions random punishment can be an effective punishment strategy to limit over-exploitation and maintain mutualism. Simulations and analyses were done in MATLAB.
## Model Schematic 
<p align="center">
<img src="https://user-images.githubusercontent.com/24704249/132567923-adc8fd2a-5746-4d5d-b35d-173463b99cf0.png" alt="schematic" height="50%" width="50%">
</p>
The model tracks the annual progression of plants and insects. Following survival and recruitment from the previous year, plants produce flowers, and pollinated flowers produce seeds. Adult insects pollinate flowers then lay eggs. Eggs hatch into juveniles that must feed on seeds to survive and grow. If the population average insect juvenile load is too high, plants randomly drop flowers as a punishment mechanism to prevent over-exploitation. 

## Key Findings
<p align="center">
<img src="https://user-images.githubusercontent.com/24704249/132569940-d2ed3cb6-e236-47fd-a6f0-a1827b00038e.png" alt="full_consumption" height="70%" width="70%">
</p>
The above figures show that as punishment gets stronger, the equilibrium plant density becomes lower, as do the equilibrium flower and seed abundances and the equilibrium insect population density. When punishment is too strong, both plant and insect population go extinct. These results suggest that random punishment benefits neither plants nor insects. 

<p align="center">
<img src="https://user-images.githubusercontent.com/24704249/132569792-064a8ecf-8aaa-46b9-b1a4-e1d43fbb8427.png" alt="assumption" height="70%" width="70%">
</p>

Our results are in conflict with the previous finding that random punishment can benefit plants. To confirm that this difference is due to our assumption that infested flowers may still bear viable seeds (as shown in panel a), we modified our model so that insect larvae consume all seeds if a flower is ever visited (panel b). 


<p align="center">
<img src="https://user-images.githubusercontent.com/24704249/132569971-3f6e41d4-2d2d-4fd7-9f3b-1739bc1a7b62.png" alt="saturating_consumption" height="70%" width="70%">
</p>
After revising the model assumption, we found that a certain level of random punishment indeed increases plant population density and keeps insects in check. 

## Summary
Overall, by considering a range of biotic contexts, this project puts important bounds on the biological scenarios under which random punishment is beneficial, and why in other scenarios, it doesn't keep the plant-insect interaction mutualistic. 
