state("MariLega")
{
    int levelNumber: 0x207D04, 0xAD8;
    int subLevel: 0x207D04, 0xC80;
    int resetTimer: 0x217300, 0x848;
    uint balloonFlag: 0x21B3F4, 0x0;
    int secretRoom: 0x21B3F0, 0x27C;
}


startup{
    settings.Add("balloon", false, "Balloon Splits");
	settings.SetToolTip("balloon", "Check this if you want splits to be done on balloon touch instead of level transitions.");
}

start
{
    if(current.resetTimer == 832){
        return true;
    } 
}

split
{
    if(current.levelNumber == 8 && current.subLevel == 4){
        if(current.resetTimer == 24064) return true;
        else return false;
    }


    if(settings["balloon"])
    {
        if(
            current.levelNumber > 1
            || current.subLevel > 1
            && current.balloonFlag > old.balloonFlag 
            && current.resetTimer > 5100 
            && current.balloonFlag > 187790615){
            return true;
        }
        if(
            current.levelNumber == 1 
            && current.subLevel == 1 
            && current.secretRoom == 0 
            && current.balloonFlag > old.balloonFlag 
            && current.resetTimer > 5100
            && current.balloonFlag > 187790615){
            return true;
        }
        if(current.subLevel == 1 && old.subLevel == 2){
            return true;
        }
        if(current.subLevel == 1 && old.subLevel == 4){
            return true;
        }
    }
    else if(current.subLevel > old.subLevel || current.levelNumber > old.levelNumber){
            return true;
    }
}

reset
{
    if(current.resetTimer == 2048 && old.resetTimer == 1664){
        return true;
    }
}

