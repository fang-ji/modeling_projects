## Background
This project uses a series of discrete-time models to show that plants' allocation strategies influence insect population dynamics and cause insect outbreaks. Specifically, we model the trade-off between overcompensatory regrowth, where plants regrow more edible biomass than what is needed to replace the biomass lost to mild herbivory, and the ability to keep energy in inedible reserves. Even though researchers have long used mathematical models to study insect outbreaks, the role of plant overcompensatory regrowth in regulating plant-herbivore interactions is largely understudied. And because previous theoretical studies have never considered the cost to compensatory regrowth, its real effect on long-term population dynamics remains unresolved. This project begins to fill the knowledge gap by modeling the inherent trade-off between using energy for overcompensatory regrowth and storing energy in reserve for future growth.

## Model Schematic 
<img width="800" alt="diagram (1)" src="https://user-images.githubusercontent.com/24704249/132713294-9f1e5882-b1c9-4d6d-a364-a6656f9280df.png">
The model tracks seasonal progression of aboveground (A) and belowground (B) plant biomass, as well as insect population density (H). As shown in the schematic, plants experience spring growth, herbivory by adult insects, compensatory regrowth, herbivory by juvenile insects and allocation of energy back to belowground tissues. Adult insects emerge and feed on aboveground biomass, then lay eggs and die. Juvenile insects hatch, start another round of herbivory, then enter pupal stage to overwinter.

## Key Results
### Bifurcation Diagram
<img width="605" alt="diagram_w_ts (1)" src="https://user-images.githubusercontent.com/24704249/132715162-135d8832-6878-42b1-82f3-fee2f17043a8.png">
The above figure shows that plant dynamics transition from extinction to fluctuations to stable equilibrium as the strength of food limitation experienced by juvenile insects gets stronger. Plant dynamics in turn influence the behavior of herbivore population, which can show 1) consumer-resource cycles, 2) consumer-resource chaos, 3) single-species chaos, 4) period 3 cycles (a periodic window within the chaotic regime), 5) single-species (period 2) cycles, and stable equilibrium. Generally, population flucutations tend to be of the consumer-resource type with weaker food limitation and of the single-species type with stronger food limitation. Competition for food is the direct mechanism of density dependent regulation in the herbivore population, so this result makes intuitive sense.


### Comparison with Overcompensation-only Model
<img width="800" alt="Screen Shot 2021-09-09 at 12 04 12 PM" src="https://user-images.githubusercontent.com/24704249/132721751-c35a0aa2-1c78-460e-b4b8-233172a130bb.png">
To understand how two plant defensive strategies -- overcompensation and allocation to inedible structures -- interact, we mathematically convert our model to one with overcompensation only, without a cost to belowground biomass stores; and one with belowground allocation but no overcompensation. The above figure shows regions of parameter space where insects and plants maintain a stable equilibrium (white), undergo single-species fluctuations (orange), undergo consumer-resource fluctuations (blue), or go extinct (grey) in (a) overcompensation-only model, (b) overcompensation + allocation model with a lower belowground allocation rate, and (c) overcompensation + allocation model with a higher belowground allocation rate. The black hatched areas indicate where overcompensation occurs at equilibrium. This comparison indicates that overcompensation does not lead to outbreaks per se in the overcompensation-only model. In the overcompensation + allocation model, single-species fluctuations may be triggered by overcompensation, whereas longer period consumer-resource fluctuations mostly occur outside the overcompensation region. 

### Comparison with Belowground Allocation-only Model

<img width="800" alt="Screen Shot 2021-09-09 at 12 04 27 PM" src="https://user-images.githubusercontent.com/24704249/132721761-871a5ee2-9cc5-4309-b7e7-0ec344457897.png">
This figure shows the parameter space of (a) belowground allocation-only model, (b) overcompensation + allocation model with with weak overcompensation, and (c) overcompensation + allocation model with strong overcompensation. This comparison indicates that single-species fluctuations are only possible when the overcompensatory regrowth of plants is strong enough.


