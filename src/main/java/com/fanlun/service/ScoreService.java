package com.fanlun.service;

import com.fanlun.bean.Score;
import com.fanlun.dao.ScoreDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class ScoreService {

    @Autowired
    private ScoreDao scoreDao;


    public List<Score> getListScore(Score score){
        return scoreDao.getListScore(score);
    }

    public int scoreCount(Score score){
        return scoreDao.scoreCount(score);
    }

    public int scoreListAdd(List<Score> scores){
        return scoreDao.scoreListAdd(scores);
    }

    public int scoreModify(Score score){
        return scoreDao.scoreModify(score);
    }

    public int scoreDelete(List<Score> scoreList){

        int delete_count = 0;

        Iterator it = scoreList.iterator();

        while (it.hasNext()){
            Score score = (Score) it.next();
            System.out.println(score);
            delete_count = delete_count + scoreDao.scoreDelete(score);
        }
        return delete_count;
    }

}
