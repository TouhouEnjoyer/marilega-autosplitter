state("MariLega")
{
    int levelNumber: 0x207D04, 0xAD8;
    int subLevel: 0x207D04, 0xC80;
    int resetTimer: 0x217300, 0x848;
}

start
{
    if(current.resetTimer == 832){
        return true;
    } 
}

split
{
    if(current.subLevel > old.subLevel || current.levelNumber > old.levelNumber){
        return true;
    }
    if(current.levelNumber == 8 && current.subLevel == 4){
        if(current.resetTimer == 24064) return true;
        else return false;
    }
    
}

reset
{
    if(current.resetTimer == 2048 && old.resetTimer == 1664){
        return true;
    }
}
