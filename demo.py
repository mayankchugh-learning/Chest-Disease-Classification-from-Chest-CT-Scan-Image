from cnnClassifier import logger
#from cnnClassifier.loggings import logger 
from cnnClassifier.utils.common import copy_file

from pathlib import Path

logger.info("Welcome to the log")



# Example usage

source_file = "artifacts/training/model.h5"


destination_file = "model/"

copy_file(source_file, destination_file)