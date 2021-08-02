tmp instruction

* gh repo:
https://github.com/MiguelMadero/DeepLearningLifeSciences-code
https://github.com/fastai/fastbook.git
https://github.com/gradient-ai/TF2.4.1.git
* image: 
deepchemio/deepchem:2.5.0
paperspace/fastai:2.0-CUDA9.2-fastbook-v0.1.0
tensorflow/tensorflow:2.4.1-gpu-jupyter
* command: 
TODO
/run.sh
jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.trust_xheaders=True --NotebookApp.disable_check_xsrf=False --NotebookApp.allow_remote_access=True --NotebookApp.allow_origin='*'

Original



Use deepchem 2.5 as a base
then install jupyter

https://jupyter.org/install

```
conda install -c conda-forge notebook
```

command: 
```
jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.trust_xheaders=True --NotebookApp.disable_check_xsrf=False --NotebookApp.allow_remote_access=True --NotebookApp.allow_origin='*'^C
```

TODO: add new Dockerfile that install notebook 
based on dc2.5, push to docker hub and test in paperspace


mamadero/deepchem-jupyter


## Sample code

```python
# Train a neural network to predict the solubility of molecules.  First load the data.

import deepchem as dc
tasks, datasets, transformers = dc.molnet.load_delaney(featurizer='GraphConv')
train_dataset, valid_dataset, test_dataset = datasets

# Create and train the model.

model = dc.models.GraphConvModel(n_tasks=1, mode='regression', dropout=0.2)
model.fit(train_dataset, nb_epoch=100)

# Evaluate it.

metric = dc.metrics.Metric(dc.metrics.pearson_r2_score)
print("Training set score")
print(model.evaluate(train_dataset, [metric], transformers))
print("Test set score")
print(model.evaluate(test_dataset, [metric], transformers))

# Use it to predict the solubility of some molecules.

smiles = ['COC(C)(C)CCCC(C)CC=CC(C)=CC(=O)OC(C)C',
          'CCOC(=O)CC',
          'CSc1nc(NC(C)C)nc(NC(C)C)n1',
          'CC(C#C)N(C)C(=O)Nc1ccc(Cl)cc1',
          'Cc1cc2ccccc2cc1C']
from rdkit import Chem
mols = [Chem.MolFromSmiles(s) for s in smiles]
featurizer = dc.feat.ConvMolFeaturizer()
x = featurizer.featurize(mols)
predicted_solubility = model.predict_on_batch(x)
for m,s in zip(smiles, predicted_solubility):
    print()
    print('Molecule:', m)
    print('Predicted solubility:', s)
```