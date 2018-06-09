package com.alexprom.uppg_reports;

import com.alexprom.entities.process.ActUPPG;




public interface Act_Manager {
    ActUPPG createAct();
    ActUPPG openAct();
    void saveAct(ActUPPG act);
    ActUPPG getAct(Long id);
}
