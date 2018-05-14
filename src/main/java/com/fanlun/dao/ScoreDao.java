package com.fanlun.dao;

import com.fanlun.bean.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScoreDao {

    //获取所有的成绩
    public List<Score> getListScore(Score score);

    public int scoreCount(Score score);

    public int scoreListAdd(@Param("scores") List<Score> scores);

    public int scoreModify(Score score);

    public int scoreDelete(Score score);

}
