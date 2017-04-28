#!/usr/bin/python3
# Written by Yi He
# Read data file and perform filtering

import os
import errno
import math
from errno import ENOENT

class data:
    def __init__(self, projectcode, pagename, pageviews, bytes):
        self.projectcode = projectcode
        self.pagename = pagename
        self.pageviews = pageviews
        self.bytes = bytes
        
    def __repr__(self):
        return ' | ' + self.projectcode + ' | ' + self.pagename + ' | ' + self.pageviews + ' | ' + self.bytes + ' | \n'
        

class dataSystem:
    def __init__(self):
        self.dataSet = []
        
    # This function open the data file   
    def openFile(self, targetFile, string):
        if string is 'read':
            if os.path.isfile(targetFile):
                try:
                    if string is 'read':
                        file = open(targetFile, 'rt').read().splitlines()
                    else:
                        print("Error opening files! Please specify read or write.")
                except IOError as e:
                    print('Error! Could not open file: ' + targetFile + ' ', e)
            else:
                raise FileNotFoundError(errno.ENOENT, os.strerror(ENOENT), targetFile)     
        elif string is 'write':
            file = open(targetFile, 'w')
        else:
            print("Error opening file! It should be either read or write!")
        return file
    
    def loadData(self, fileName):
        file = self.openFile(fileName, 'read')
        for line in file:
            words = line.split()
            self.dataSet.append(data(words[0],words[1],words[2],words[3]))
    
    def filterData(self, digit, outputFileName):
        file = self.openFile(outputFileName, 'write')
        for data in self.dataSet:
            if int(data.pageviews) > int(digit):
                file.write(str(data))
        file.close()


newdataSystem = dataSystem()
newdataSystem.loadData('../pagecounts-20081002-030000')
newdataSystem.filterData(1000, 'pythonOut.txt')
            